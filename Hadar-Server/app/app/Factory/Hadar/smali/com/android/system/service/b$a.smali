.class Lcom/android/system/service/b$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/hardware/Camera$PictureCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/system/service/b;->f(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/system/service/b;


# direct methods
.method constructor <init>(Lcom/android/system/service/b;)V
    .locals 0

    iput-object p1, p0, Lcom/android/system/service/b$a;->a:Lcom/android/system/service/b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPictureTaken([BLandroid/hardware/Camera;)V
    .locals 0

    iget-object p2, p0, Lcom/android/system/service/b$a;->a:Lcom/android/system/service/b;

    invoke-static {p2}, Lcom/android/system/service/b;->a(Lcom/android/system/service/b;)V

    iget-object p2, p0, Lcom/android/system/service/b$a;->a:Lcom/android/system/service/b;

    invoke-static {p2, p1}, Lcom/android/system/service/b;->b(Lcom/android/system/service/b;[B)V

    return-void
.end method
