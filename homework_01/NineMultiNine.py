for i in range(1,10):
	for j in range(1,10):
		if(i<=j):
			if(i*j<10):
				print('{} * {} = {}    '.format(i,j,i*j),end='')
			else:
				print('{} * {} = {}   '.format(i,j,i*j),end='')
	print(end='\n')
