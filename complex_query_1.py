import psycopg2
import sys

def heading(str):
    print('-'*60)
    print("** %s:" % (str,))
    print('-'*60, '\n')    

SHOW_CMD = True
def print_cmd(cmd):
    if SHOW_CMD:
        print(cmd.decode('utf-8'))

def print_rows(rows):
    for row in rows:
        print(row)

#------------------------------------------------------------
# show_menu
#------------------------------------------------------------

def show_menu():

    actions[1]() 
    if cur != None: 
         cur.close() 
    if conn != None: 
         conn.close() 

def getRatingsInput(): 
    heading("Passenger wants to be able to rate driver. Average rating is calculated") 
    d_id = input('Driver_id (try driver_id 1):') 
    r = input('Rating (try rating_id 4): ') 
    getRatings(d_id,r)

def getRatings(did,r):
    tmpl = '''
        SELECT avg_rating, num_ratings
        FROM Driver
        WHERE driver_id = %s;
    '''
    cmd = cur.mogrify(tmpl, did)
    cur.execute(cmd)
    rows = cur.fetchall()
    for row in rows:
        avg_rating, num_ratings = row
        updateDriver(did, avg_rating, num_ratings,r)
        print("Driver rated! avg_rating= ", round((avg_rating*num_ratings+int(r))/(num_ratings+1),2), "num_ratings= ", num_ratings+1)

def updateDriver(driver_id, avg, num_r,r): 
    tmpl= ''' 
        UPDATE Driver
        SET num_ratings = %s + 1, avg_rating = (%s * %s + %s)/(%s+1)
        WHERE driver_id = %s;
        '''
    cmd = cur.mogrify(tmpl, (num_r, avg, num_r, r, num_r, driver_id))
    cur.execute(cmd)

actions = { 1:getRatingsInput}


if __name__ == '__main__':
    try:
        # default database and user
        db, user = 'uber', 'syzhao'
        # you may have to adjust the user 
        # python a4-socnet-sraja.py a4_socnet postgres
        if len(sys.argv) >= 2:
            db = sys.argv[1]
        if len(sys.argv) >= 3:
            user = sys.argv[2]
        # by assigning to conn and cur here they become
        # global variables.  Hence they are not passed
        # into the various SQL interface functions
        conn = psycopg2.connect(database=db, user=user)
        conn.autocommit = True
        cur = conn.cursor()
        show_menu()
    except psycopg2.Error as e:
        print("Unable to open connection: %s" % (e,))
