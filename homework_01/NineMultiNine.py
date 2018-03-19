#For loop function
#No.1
for i in range(1,10):
	for j in range(1,10):
		if(i>=j):
			if(i*j<10):
				print('{} * {} = {}    '.format(j,i,i*j),end='')
			else:
				print('{} * {} = {}   '.format(j,i,i*j),end='')
	print(end='\n')

print('*'*110)

#No.2
j=9
while (j > 0) :
	for i in range(1,10):
		if(j>=i):
			if(i*j<10):
				print('{} * {} = {}    '.format(i,j,i*j),end='')
			else:
				print('{} * {} = {}   '.format(i,j,i*j),end='')
	print(end='\n')
	j = j-1

print('*'*110)

#No.3
print('*'*110)
for i in range(1,10):
	for j in range(9,0,-1):
		if(i>=j):
			print('{}*{}={:3}'.format(j,i,i*j), end=' ')
		else:
			print(end='\t')
	print(end='\n')

print('*'*100)
#No.4
for i in range(9,0,-1):
	for j in range(9,0,-1):
		if(i>=j):
			print('{}*{}={:3}'.format(i,j,i*j), end=' ')
		else:
			print(end='\t')
	print(end='\n')
