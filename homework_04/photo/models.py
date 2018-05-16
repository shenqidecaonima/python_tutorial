from django.db import models
from datetime import datetime

# Create your models here.
class PhotoInfo(models.Model):
    photoName = models.CharField(max_length=250)
    addtime = models.DateTimeField(default=datetime.now)

    def __str__(self):
        return "%d,%s"%(self.id,self.photoName)
