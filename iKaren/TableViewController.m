//
//  TableViewController.m
//  iKaren
//
//  Created by Ehkalu Moo on 11/25/14.
//  Copyright (c) 2014 Ehkalu Moo. All rights reserved.
//

#import "TableViewController.h"
#import "DetailsViewController.h"
#import "Karen.h"

@implementation TableViewController

@synthesize allTableData;
@synthesize filteredTableData;
@synthesize searchBar;
@synthesize isFiltered;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    searchBar.delegate = (id)self;
    
    allTableData = [[NSMutableArray alloc] initWithObjects:
                    [[Karen alloc] initWithName:@"Steak"   andDescription:@"Rare" detail:@"-noun" navbar:@""],
                    [[Karen alloc] initWithName:@"freak"   andDescription:@"Rare" detail:@"-noun" navbar:@""],
                    [[Karen alloc] initWithName:@"goat"   andDescription:@"Rare" detail:@"-noun" navbar:@""],
                    [[Karen alloc] initWithName:@"cream"   andDescription:@"Rare" detail:@"-noun" navbar:@""],

 nil ];
}



- (void)viewDidUnload
{
    [self setSearchBar:nil];
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int rowCount;
    if(self.isFiltered)
        rowCount = filteredTableData.count;
    else
        rowCount = allTableData.count;
    
    return rowCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if
        (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    
   Karen* karens;
    
    if(isFiltered)
        karens = [filteredTableData objectAtIndex:indexPath.row];
    else
        karens= [allTableData objectAtIndex:indexPath.row];
    
    cell.textLabel.text = karens.name;
    cell.detailTextLabel.text = karens.description;
    cell.detailTextLabel.text =karens.detail;
    
    return cell;
}

#pragma mark - Table view delegate

-(void)searchBar:(UISearchBar*)searchBar textDidChange:(NSString*)text
{
    if(text.length == 0)
    {
        isFiltered = FALSE;
    }
    else
    {
        isFiltered = true;
        filteredTableData = [[NSMutableArray alloc] init];
        
        for
            (Karen* karens in allTableData)
        {
            NSRange nameRange = [karens.name rangeOfString:text options:NSCaseInsensitiveSearch];
            NSRange descriptionRange = [karens.description rangeOfString:text options:NSCaseInsensitiveSearch];
            NSRange detailRange = [karens.detail rangeOfString:text options:NSCaseInsensitiveSearch];
            
            
            if(nameRange.location != NSNotFound || descriptionRange.location != NSNotFound || detailRange.location != NSNotFound)
            {
                [filteredTableData addObject:karens];
            }
        }
    }
    
    [self.tableView reloadData];
}


- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self showDetailsForIndexPath:indexPath];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self showDetailsForIndexPath:indexPath];
}

-(void) showDetailsForIndexPath:(NSIndexPath*)indexPath
{
    [self.searchBar resignFirstResponder];
    DetailsViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailsViewController"];
    Karen* karens;
    
    if(isFiltered)
    {
        karens = [filteredTableData objectAtIndex:indexPath.row];
    }
    else
    {
        karens = [allTableData objectAtIndex:indexPath.row];
    }
    
    vc.karens = karens;
    [self.navigationController pushViewController:vc animated:true];
}


/*
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Perform segue to candy detail
    [self performSegueWithIdentifier:@"candyDetail" sender:tableView];
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ( [[segue identifier] isEqualToString:@"candyDetail"] ) {
        UIViewController *DetailsViewController = [segue destinationViewController];
        
        // In order to manipulate the destination view controller, another check on which table (search or normal) is displayed is needed
        if(sender == self.searchDisplayController.searchResultsTableView) {
            NSIndexPath *indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            NSString *destinationTitle = [[allTableData objectAtIndex:[indexPath row]] name];
            [DetailsViewController setTitle:destinationTitle];
        }
        else {
            NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
            NSString *destinationTitle = [[filteredTableData objectAtIndex:[indexPath row]] name];
            [DetailsViewController setTitle:destinationTitle];
            
        }
        
    }
}
*/
@end
