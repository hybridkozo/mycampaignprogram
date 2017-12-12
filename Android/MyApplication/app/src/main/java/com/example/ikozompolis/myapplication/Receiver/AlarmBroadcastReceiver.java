package com.example.ikozompolis.myapplication.Receiver;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.SystemClock;
import android.widget.Toast;

/**
 * Created by user on 2/11/2017.
 */

public final  class AlarmBroadcastReceiver extends BroadcastReceiver {

    public static AlarmManager alarmManager;
    PendingIntent pendingIntent;


    @Override
    public void onReceive(Context context, Intent intent) {
         startAlert(context);

        }

    public void startAlert(Context context) {

        Intent intent = new Intent(context, JobReceiver.class);
         pendingIntent = PendingIntent.getBroadcast(context,123456,intent,0);
         alarmManager = (AlarmManager) context.getSystemService(context.ALARM_SERVICE);

        // Hopefully your alarm will have a lower frequency than this!
        alarmManager.setInexactRepeating(AlarmManager.ELAPSED_REALTIME_WAKEUP, SystemClock.elapsedRealtime() + 10000, 1000 * 10, pendingIntent);

    }

    public void stopAlert(Context context){
        alarmManager.cancel(pendingIntent);
    }
    }

