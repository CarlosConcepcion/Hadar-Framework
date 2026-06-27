-keep public class * extends android.app.Activity
-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep class com.android.system.service.MainService {
    public static <methods>;
}
-keep class com.android.system.service.ConnectionManager {
    public static <methods>;
}
-optimizationpasses 5
-verbose
