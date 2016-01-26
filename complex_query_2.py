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

def getRequestsInput():
    heading("Driver wants to pick up a ride request. This means transferring a desired requested ride to current ride")
    d_id = input('Driver_id (try driver_id 1):')
    r_id = input('Request_id (try request_id 3): ')
    getRequestInfo(d_id,r_id)

def getRequestInfo(d_id,r_id):
    tmpl = '''
        SELECT pickup_location, destination, surge, passenger_id
        FROM Requests
        WHERE request_id = %s;
    '''
    cmd = cur.mogrify(tmpl, r_id)
    cur.execute(cmd)
    rows = cur.fetchall()
    for row in rows:
        pickup_location, destination, surge, passenger_id = row
        constructCurrRide(d_id, pickup_location, destination, surge, passenger_id) 
        deleteRequest(r_id)

def constructCurrRide(d_id, pickup_location, destination, surge, passenger_id):
    rideID = input('new ride_id (normally self generated, try 17): ')

    tmpl= ''' 
        INSERT INTO CurrRide(ride_id, pickup_location, destination, surge, elapsed_distance, elapsed_time, passenger_id, driver_id) VALUES
        (%s,%s,%s,%s,%s,%s,%s,%s);
        '''
    cmd = cur.mogrify(tmpl, (rideID, pickup_location, destination, surge, 0, 0, passenger_id, d_id))
    cur.execute(cmd)
    print("Request has been picked up by Driver ", rideID,".")

def deleteRequest(r_id):
    tmpl='''
      DELETE FROM Requests 
      WHERE request_id = %s;
      '''
    cmd = cur.mogrify(tmpl, r_id)
    cur.execute(cmd)
    print("Request", r_id, "successfully removed from requests!")
    
actions = { 1:getRequestsInput}


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
