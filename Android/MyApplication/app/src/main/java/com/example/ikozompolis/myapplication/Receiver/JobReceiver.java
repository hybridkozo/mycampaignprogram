package com.example.ikozompolis.myapplication.Receiver;



import android.app.job.JobInfo;
import android.app.job.JobScheduler;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.widget.Toast;

import com.example.ikozompolis.myapplication.services.JobServiceLocation;

/**
 * Created by user on 2/11/2017.
 */

public class JobReceiver extends BroadcastReceiver {
    JobScheduler jobScheduler;

    @Override
    public void onReceive(Context context, Intent intent) {
        Toast.makeText(context, "Alarm is running....", Toast.LENGTH_LONG).show();
        //jobScheduler =  context.getSystemService(JobScheduler.class);

        jobScheduler = (JobScheduler) context.getSystemService(context.JOB_SCHEDULER_SERVICE);
        jobScheduler.schedule(new JobInfo.Builder(1,
                new ComponentName(context, JobServiceLocation.class))
                .setRequiredNetworkType(JobInfo.NETWORK_TYPE_ANY)
                .build());
    }
}
