/*
sharedPreferences = getSharedPreferences(GpsPREFERENCES,Context.MODE_PRIVATE);

        SharedPreferences.Editor editor = sharedPreferences.edit();
        latitude = location.getLatitude();
        editor.putString("latitude",String.valueOf(latitude));

        longitude = location.getLongitude();
        editor.putString("longitude",String.valueOf(longitude));
        editor.commit();*/


package com.example.ikozompolis.myapplication.services;

import android.Manifest;
import android.app.IntentService;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.location.Location;
import android.location.LocationManager;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.support.annotation.Nullable;
import android.util.Log;
import android.widget.Toast;
import android.support.v4.content.ContextCompat;

/**
 * Created by ikozompolis on 1/11/2017.
 *
 * This class is a service that is running on the background and listen the GPS provider in order to save new Locations on shared preferences
 */
public class GPSService extends IntentService{

    private static final String TAG ="Location_Listener" ;
    public static final String GpsPREFERENCES = "GpsLocations" ;
    private static final int LOCATION_INTERVAL = 10000;
    private static final float LOCATION_DISTANCE = 0;
    final Handler handler = new Handler();
    Location mLastLocation;
    LocationManager mLocationManager;
    SharedPreferences sharedPreferences;

    public GPSService() {
        super("GPSService");
    }

    LocationListener[] mLocationListeners = new LocationListener[] {
            new LocationListener(LocationManager.GPS_PROVIDER)/*,
            new LocationListener(LocationManager.NETWORK_PROVIDER)*/
    };


    @Nullable
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override
    protected void onHandleIntent(@Nullable Intent intent) {
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {

        Toast.makeText(getApplicationContext(),"Starting service...",Toast.LENGTH_LONG).show();


        if (ContextCompat.checkSelfPermission(this, Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED&&ContextCompat.checkSelfPermission(this, android.Manifest.permission.ACCESS_COARSE_LOCATION) != PackageManager.PERMISSION_GRANTED) {

            Toast.makeText(getApplicationContext(),"Permissions are not granted...",Toast.LENGTH_LONG).show();
            sharedPreferences = getSharedPreferences(GpsPREFERENCES,Context.MODE_PRIVATE);

        }else {

            initializeLocationManager();

            sharedPreferences = getSharedPreferences(GpsPREFERENCES,Context.MODE_PRIVATE);

           /* try {
                mLocationManager.requestLocationUpdates(
                        LocationManager.NETWORK_PROVIDER, LOCATION_INTERVAL, LOCATION_DISTANCE,
                        mLocationListeners[1]);
            } catch (java.lang.SecurityException ex) {
                Log.v(TAG, "fail to request location update, ignore", ex);
            } catch (IllegalArgumentException ex) {
                Log.v(TAG, "network provider does not exist, " + ex.getMessage());
            }*/

            try {
                mLocationManager.requestLocationUpdates(
                        LocationManager.GPS_PROVIDER, LOCATION_INTERVAL, LOCATION_DISTANCE,
                        mLocationListeners[0]);
            } catch (java.lang.SecurityException ex) {
                Log.v(TAG, "fail to request location update, ignore", ex);
            } catch (IllegalArgumentException ex) {
                Log.v(TAG, "gps provider does not exist " + ex.getMessage());
            }

        }

        if(mLocationListeners[0]!=null){
            searchNewLocation();

        }

        return Service.START_NOT_STICKY;
    }


    @Override
    public void onDestroy() {

        super.onDestroy();
        stopSearchNewLocation();
        stopLocationListeners();
        Toast.makeText(getApplicationContext(), "The service has been stopped...", Toast.LENGTH_SHORT).show();

    }

    private void initializeLocationManager() {

        if (mLocationManager == null) {
            mLocationManager = (LocationManager) getApplicationContext().getSystemService(Context.LOCATION_SERVICE);
        }

    }

    private void searchNewLocation(){
        handler.postDelayed(new Runnable() {

            @Override
            public void run() {
                Toast.makeText(getApplicationContext(), "Get the last location every 10 seconds...", Toast.LENGTH_SHORT).show();
                if (mLastLocation!=null) {
                    if(String.valueOf(mLastLocation.getLatitude())!=null) {
                        SharedPreferences.Editor editor = sharedPreferences.edit();
                        editor.putString("latitude", String.valueOf(mLastLocation.getLatitude()));
                        editor.putString("longitude", String.valueOf(mLastLocation.getLongitude()));
                        editor.commit();
                    }
                }

                handler.postDelayed(this, 10000);
            }
        }, 10000);
    }

    private void stopSearchNewLocation(){
        handler.removeCallbacksAndMessages(null);
    }

    private void stopLocationListeners(){
        Log.v(TAG, "onDestroy");
        super.onDestroy();
        if (mLocationManager != null) {
            try {
                mLocationManager.removeUpdates(mLocationListeners[0]);
                //mLocationManager.removeUpdates(mLocationListeners[1]);
            } catch (Exception ex) {
                Log.v(TAG, "fail to remove location listners, ignore", ex);
            }

        }
    }


    private class LocationListener implements android.location.LocationListener
    {
        //Location mLastLocation;

        public LocationListener(String provider)
        {
            Log.v(TAG, "LocationListener " + provider);
            mLastLocation = new Location(provider);
        }

        @Override
        public void onLocationChanged(Location location)
        {
            Log.v(TAG, "onLocationChanged: " + location);
            mLastLocation.set(location);
        }

        @Override
        public void onProviderDisabled(String provider)
        {
            Log.v(TAG, "onProviderDisabled: " + provider);
            stopSearchNewLocation();
            Toast.makeText(GPSService.this, "Stop searching for new locations...", Toast.LENGTH_SHORT).show();
        }

        @Override
        public void onProviderEnabled(String provider)
        {
            Log.v(TAG, "onProviderEnabled: " + provider);
            searchNewLocation();
            Toast.makeText(GPSService.this, "Start searching for new locations...", Toast.LENGTH_SHORT).show();
        }

        @Override
        public void onStatusChanged(String provider, int status, Bundle extras)
        {
            Log.v(TAG, "onStatusChanged: " + provider);
        }
    }


}

