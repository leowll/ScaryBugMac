//
//  MasterViewController.m
//  ScaryBugsMac
//
//  Created by 王亮亮 on 15/9/21.
//  Copyright (c) 2015年 王亮亮. All rights reserved.
//

#import "MasterViewController.h"

#import "ScaryBugDoc.h"
#import "ScaryBugData.h"
#import "EDStarRating.h"

@interface MasterViewController ()
@property (weak) IBOutlet NSTableView *bugsTableView;
@property (strong) IBOutlet NSTextField *bugTitleView;
@property (weak) IBOutlet EDStarRating *bugRating;
@property (weak) IBOutlet NSImageView *bugImageView;


@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}
- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    
    // Get a new ViewCell
    NSTableCellView *cellView = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
    
    // Since this is a single-column table view, this would not be necessary.
    // But it's a good practice to do it in order by remember it when a table is multicolumn.
    if( [tableColumn.identifier isEqualToString:@"BugColumn"] )
    {
        ScaryBugDoc *bugDoc = [self.bugs objectAtIndex:row];
        cellView.imageView.image = bugDoc.thumbImage;
        cellView.textField.stringValue = bugDoc.data.title;
        return cellView;
    }
    return cellView;
}

-(void)loadView
{
    [super loadView];
    self.bugRating.starImage = [NSImage imageNamed:@"star.png"];
    self.bugRating.starHighlightedImage = [NSImage imageNamed:@"shockedface2_full.png"];
    self.bugRating.starImage = [NSImage imageNamed:@"shockedface2_empty.png"];
    self.bugRating.maxRating = 5.0;
    self.bugRating.delegate = (id<EDStarRatingProtocol>) self;
    self.bugRating.horizontalMargin = 12;
    self.bugRating.editable=YES;
    self.bugRating.displayMode=EDStarRatingDisplayFull;
    
    
    self.bugRating.rating= 0.0;
}

-(ScaryBugDoc*)selectedBugDoc
{
    NSInteger selectedRow = [self.bugsTableView selectedRow];
    if( selectedRow >=0 && self.bugs.count > selectedRow )
    {
        ScaryBugDoc *selectedBug = [self.bugs objectAtIndex:selectedRow];
        return selectedBug;
    }
    return nil;
    
}

-(void)setDetailInfo:(ScaryBugDoc*)doc
{
    NSString    *title = @"";
    NSImage     *image = nil;
    float rating=0.0;
    if( doc != nil )
    {
        title = doc.data.title;
        image = doc.fullImage;
        rating = doc.data.rating;
    }
    [self.bugTitleView setStringValue:title];
    [self.bugImageView setImage:image];
    [self.bugRating setRating:rating];
    
}

- (void)tableViewSelectionDidChange:(NSNotification *)aNotification
{
    ScaryBugDoc *selectedDoc = [self selectedBugDoc];
    
    // Update info
    [self setDetailInfo:selectedDoc];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [self.bugs count];
}

- (IBAction)addBug:(id)sender {
    // 1. Create a new ScaryBugDoc object with a default name
    ScaryBugDoc *newDoc = [[ScaryBugDoc alloc] initWithTitle:@"New Bug" rating:0.0 thumbImage:nil fullImage:nil];
    
    // 2. Add the new bug object to our model (insert into the array)
    [self.bugs addObject:newDoc];
    NSInteger newRowIndex = self.bugs.count-1;
    
    // 3. Insert new row in the table view
    [self.bugsTableView insertRowsAtIndexes:[NSIndexSet indexSetWithIndex:newRowIndex] withAnimation:NSTableViewAnimationEffectGap];
    
    // 4. Select the new bug and scroll to make sure it's visible
    [self.bugsTableView selectRowIndexes:[NSIndexSet indexSetWithIndex:newRowIndex] byExtendingSelection:NO];
    [self.bugsTableView scrollRowToVisible:newRowIndex];
}
- (IBAction)deleteBug:(id)sender {
}


@end
