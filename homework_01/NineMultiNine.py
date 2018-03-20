#For loop function
#No.1
print('For Loop')
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



#While loop
#No.1
print('While Loop')
i=1
while(i<10):
	j=1
	while(j<10):
		if(j<=i):
			print('{} * {} = {}'.format(i,j,i*j),end='\t')
		j=j+1
	i=i+1
	print(end='\n')

print('*'*110)

#No.2
i=1
while(i<10):
	j=1
	while(j<10):
		if(j>=i):
			print('{} * {} = {}'.format(i,j,i*j),end='\t')
		j=j+1
	i=i+1
	print(end='\n')

print('*'*110)

#No.3
i=0
while(i<10):
	j=9
	while j>0 :
		if(i>=j):
			print('{}*{}={:3}'.format(i,j,i*j), end='\t')
		else:
			print(end='\t')
		j = j - 1
	i = i + 1
	print(end='\n')

print('*'*100)
#No.4
i=9
while(i>0):
	j=9
	while j>0 :
		if(i>=j):
			print('{}*{}={:3}'.format(i,j,i*j), end='\t')
		else:
			print(end='\t')
		j = j - 1
	i = i - 1
	print(end='\n')
