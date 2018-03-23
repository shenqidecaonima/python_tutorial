for i in range(1,10):
	for a in range(i+1,10):
		print(end='')
	for j in range(1,i+1):
		print('%d*%d=%2d\t'%(j,i,i*j), end ='')
	print('')
