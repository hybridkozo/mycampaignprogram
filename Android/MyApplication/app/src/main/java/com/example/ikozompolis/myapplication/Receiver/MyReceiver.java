package com.example.ikozompolis.myapplication.Receiver;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.util.Log;
import android.widget.Toast;

import com.example.ikozompolis.myapplication.MainActivity;
import com.example.ikozompolis.myapplication.services.GPSService;

/**
 * Created by user on 12/10/2017.
 */

public class MyReceiver extends BroadcastReceiver {

    @Override
    public void onReceive(Context context, Intent intent) {

        if (intent.getAction().matches("android.intent.action.BOOT_COMPLETED")) {
            Toast.makeText(context, "Starting the GPSService after device boot...", Toast.LENGTH_SHORT).show();
            Intent pushIntent = new Intent(context, GPSService.class);
            context.startService(pushIntent);
        }
    }
}
