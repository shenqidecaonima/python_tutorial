#It is a Bank System

#Account List
accountList=[
    {'Name':'Moyuan','Current Balance':'1000','Password':'1234'},
    {'Name':'Li','Current Balance':'1000','Password':'1234'},
    {'Name':'Teddy','Current Balance':'1000','Password':'1234'}

    ]

#define a function to show the information about the Account
def ShowAccount(accountList):
    '''
    Show the information about the selected Account
    param: list
    '''
    if len(accountList)==0:
        print('======No Data======')
        return
    print("|{0:<5} |{1:<10}| {2:<5}".format("ID","Name","Current Balance"))
    print("-"*40)
    for i in range(len(accountList)):
        print('|{0:<5} |{1:<10}| {2:<5}'.format(i+1,accountList[i]['Name'],accountList[i]['Current Balance']))

#define a function to add user into System
def Register(name,password):
    account={}
    account['name']=name
    account['password']=password
    account['Current Balance']=0
    accountList.append(account)

#define a function to check name and password
def checkPassword(name,password):
    '''
    Check whether the name and password are matched， if it is combined, return True, otherwise return False
    '''
    for i in range(len(accountList)):
        if(accountList[i]['Name']==name):
            if(accountList[i]['Password']==password):
                return True
    return False

money = 0
number = 0 #define a global int
hasName = False
#define a function to save money into the Account

#define check name function
def checkName(name):
    '''
    Check Name, if Account name already Existed, return True; otherwise return False
    '''
    for i in range(len(accountList)):
        if(accountList[i]['Name']==name):
            number=i
            return True
    return False

#Login page
print('='*14,'Bank System','='*14)
print('{:12}  {:12}'.format('1.Login','2.Register'))
print('='*41)
cmd = input('Please Enter the Command Number: ')
if(cmd=='2'):
    name = input('Please Enter Account Name: ')
    password = input('Please Enter the Password: ')
    while(checkName(name)):
        print('Account Name has existed, Enter Again')
        name = input('Please Enter Account Name: ')
        password = input('Please Enter the Password: ')
    Register(name,password)
else:
    name = input('Please Enter Account Name: ')
    #check name and password
    while(checkName(name)==False):
        print('Invalid Name')
        name = input('Please Enter Account Name: ')
    password = input('Please Enter the Password: ')
    if(checkPassword(name,password)==False):
        print('Wrong Password, Sorry!')

    else:
        #Menu Page
        print('='*14,'Bank System','='*14)
        print('{:12}  {:12}'.format('1.Check Account','2.Deposits'))
        print('{:15}  {:12}'.format('3.Withdraw','4.Exit'))
        print('='*41)

        #Trans key into separate pages
        while True:
            key = input('Please Enter The Command Number: ')
            if(key=='1'):
                print('='*14,'Account Information','='*14)
                ShowAccount(accountList)
            elif(key=='2'):
                print('='*14,'Deposits','='*14)
                name = input('Please Enter Account Name: ')
                #Check name
                for i in range(len(accountList)):
                    if(accountList[i]['Name']==name):
                        number=i
                        hasName=True
                #Check if there is enough money
                if(hasName==True):
                    money = input('Please Enter Money Amount: ')
                    if(int(money)<int(accountList[number]['Current Balance'])):
                        money = int(accountList[number]['Current Balance']) + int(money) #add the money into account
                        accountList[number]['Current Balance'] = str(money)
                    else:
                        print('='*10,'Sorry, Not Enough Money','='*5)
                else:
                    print('='*10,'Sorry, Invalid Name','='*5)

            elif(key=='3'):
                print('='*14,'Withdraw','='*14)
                name = input('Please Enter Account Name: ')

                for i in range(len(accountList)):
                    if(accountList[i]['Name']==name):
                        number=i
                        
                if(checkName(name)):
                    money = input('Please Enter Money Amount: ')
                    if(int(money)<int(accountList[number]['Current Balance'])):
                        money = int(accountList[number]['Current Balance']) - int(money) #add the money into account
                        accountList[number]['Current Balance'] = money
                    else:
                        print('='*10,'Sorry, Not Enough Money','='*5)
                else:
                    print('='*10,'Sorry, Invalid Name','='*5)
            elif(key=='4'):
                print('='*14,'EXIT','='*14)
                break
            else:
                print('Invalid Command')
