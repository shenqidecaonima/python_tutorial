# 用户图形界面的实战
# 
#导入模块
import wx


#定义事件处理函数
def load(event):
	'''加载文件内容'''
	file = open(filename.GetValue(),"r")
	contents.SetValue(file.read())
	file.close()
def save(event):
	'''保存文件内容'''
	file = open(filename.GetValue(),"w")
	file.write(contents.GetValue())
	file.close()


#创建应用程序对象
app = wx.App()
#创建一个窗口
win = wx.Frame(None,title="我的记事本",size=(410,335))

loadButton = wx.Button(win,label="Open",pos=(225,5),size=(80,25))
saveButton = wx.Button(win,label="Save",pos=(315,5),size=(80,25))

#为按钮组件绑定事件处理
loadButton.Bind(wx.EVT_BUTTON,load)
saveButton.Bind(wx.EVT_BUTTON,save)

filename = wx.TextCtrl(win,pos=(5,5),size=(210,25))

contents = wx.TextCtrl(win,pos=(5,35),size=(390,260),style=wx.TE_MULTILINE| wx.HSCROLL)

#设置可见
win.Show()
#进入应用程序事件主循环
app.MainLoop()