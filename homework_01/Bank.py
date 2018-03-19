#It is a Bank System

#Menu Page
print('='*14,'Bank System','='*14)
print('{:12}  {:12}'.format('1.Check Account','2.Deposits'))
print('{:15}  {:12}'.format('3.Withdraw','4.Exit'))
print('='*41)


#Account List
accountList=[
    {'Name':'Moyuan','Current Balance':'1000','Password':'1234'}]

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


number = 0 #define a global int
hasName = False
#define a function to save money into the Account



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
                money = accountList[number]['Current Balance'] + money #add the money into account
                accountList[number]['Current Balance'] = money
            else:
                print('='*10,'Sorry, Not Enough Money','='*5)
        else:
            print('='*10,'Sorry, Invalid Name','='*5)



    elif(key=='3'):
        print('='*14,'Withdraw','='*14)
    elif(key=='4'):
        print('='*14,'EXIT','='*14)
        break
    else:
        print('Invalid Command')
