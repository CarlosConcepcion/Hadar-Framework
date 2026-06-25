.class Lcom/hadar/framework/b$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/hardware/Camera$PictureCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hadar/framework/b;->f(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/hadar/framework/b;


# direct methods
.method constructor <init>(Lcom/hadar/framework/b;)V
    .locals 0

    iput-object p1, p0, Lcom/hadar/framework/b$a;->a:Lcom/hadar/framework/b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPictureTaken([BLandroid/hardware/Camera;)V
    .locals 0

    iget-object p2, p0, Lcom/hadar/framework/b$a;->a:Lcom/hadar/framework/b;

    invoke-static {p2}, Lcom/hadar/framework/b;->a(Lcom/hadar/framework/b;)V

    iget-object p2, p0, Lcom/hadar/framework/b$a;->a:Lcom/hadar/framework/b;

    invoke-static {p2, p1}, Lcom/hadar/framework/b;->b(Lcom/hadar/framework/b;[B)V

    return-void
.end method
