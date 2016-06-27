//
//  FISPrimeTimeTableViewController.m
//  PrimeTime
//
//  Created by John Hussain on 6/25/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISPrimeTimeTableViewController.h"

@interface FISPrimeTimeTableViewController ()

@property (strong, nonatomic) NSMutableDictionary *primeList;

@end

@implementation FISPrimeTimeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.accessibilityIdentifier = @"table";
    
    self.primeList = [[NSMutableDictionary alloc] init];
    
    for (int x=0; x<100; x++) {
        NSString *keyString = [NSString stringWithFormat:@"%i", x];
        NSString *valueString = [NSString stringWithFormat:@"%li", [self primeNumber:x+1]];
        
        [self.primeList setObject:valueString  forKey:keyString];
    }
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 100;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *keyString = [NSString stringWithFormat:@"%li", indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"primeCell" forIndexPath:indexPath];
    
     cell.textLabel.text = self.primeList[keyString];
    
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

-(NSInteger)primeNumber:(NSInteger)prime{
    
    
//        int i, j;
//        
//        for(i=2; i<100; i++) {
//            
//            for(j=2; j <= (i/j); j++)
//                
//                if(!(i%j)) break; // if factor found, not prime
//            
//            if(j > (i/j)) NSLog(@"%d is prime\n", i);
//        }
//    
//    NSLog(@"%i", i);
//        return 0;
    
    
    NSInteger count = 2;
    NSInteger currentNumber = 5;
    
    if (prime == 1) {
        return 2;
    } else if (prime == 2) {
        return 3;
    }
    
    while (count < prime) {
        if (currentNumber%2 != 0) {
            BOOL currentPrime = true;
            for (int x = 3; x < currentNumber; x = x + 2) {
                if (currentNumber%x == 0)
                {
                    currentPrime = false;
                }
            }
            if (currentPrime) {
                count++;
            }
            currentNumber+=2;
        }
    }
    
    return currentNumber-2;
}

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
