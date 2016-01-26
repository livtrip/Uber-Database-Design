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

def getRideInput():
    heading("Driver wants to complete a ride. This means moving the ride from currRide to completeRide and adding a calculated price based on total distance and time")
    ride_id = input('ride_id (try ride_id 8):')
    print("Transferring ride ", ride_id, " from currRide to completeRide.")
    getRideInfo(ride_id)

def getRideInfo(ride_id):
    tmpl = '''
        SELECT *
        FROM CurrRide
        WHERE ride_id = %s;
    '''
    cmd = cur.mogrify(tmpl, (ride_id))
    cur.execute(cmd)
    rows = cur.fetchall()
    for row in rows:
        ride_id, pickup_location, destination, surge, elapsed_distance, elapsed_time, passenger_id, driver_id = row
        price = calculatePrice(elapsed_distance, elapsed_time, surge)
        constructCompleteRide(ride_id, pickup_location, destination, surge, elapsed_distance, elapsed_time, passenger_id, driver_id, price) 
        deleteCurrRide(ride_id)

def calculatePrice(distance, time, surge):
    #Base fare 1.5 + 0.2 per min + 1.2 per mile
    #if surge == true, double the price
    result = round((1.50 + 0.2 * float(time) + 1.2 * float(distance)) * (1 + surge),3)
    print("Price", "$"+str(result), "is calculated.")
    if (surge):
        print("Surge (price x2) applied.")
    else:
        print("No surge applied.")
    return result

def constructCompleteRide(ride_id, pickup_location, destination, surge, elapsed_distance, elapsed_time, passenger_id, driver_id, price):

    tmpl= ''' 
        INSERT INTO CompleteRide(ride_id, pickup_location, destination, surge, total_distance, total_time, passenger_id, driver_id, price) VALUES
        (%s,%s,%s,%s,%s,%s,%s,%s,%s);
        '''
    cmd = cur.mogrify(tmpl, (ride_id, pickup_location, destination, surge, elapsed_distance, elapsed_time, passenger_id, driver_id, price))
    cur.execute(cmd)

def deleteCurrRide(r_id):
    tmpl='''
      DELETE FROM CurrRide 
      WHERE ride_id = %s;
      '''
    cmd = cur.mogrify(tmpl, r_id)
    cur.execute(cmd)
    print("Ride", r_id, "successfully moved from currRide to completeRide!")
    
actions = { 1:getRideInput}


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
