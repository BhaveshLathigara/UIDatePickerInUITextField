-(void) setDatePickerForTextField:(UITextField *)textfield
                   datePickerMode:(UIDatePickerMode)mode
                           Target:(id)target
                     DoneSelector:(SEL)doneSelector
                   CancelSelector:(SEL)cancelSelector
{
    UIDatePicker *picker = [[[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, 320, 216)] autorelease];
    picker.datePickerMode = mode;
    
//    if(mode == UIDatePickerModeTime)
//        picker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"NL"];
//    else
//        picker.locale = nil;
    
    textfield.inputAccessoryView = [self getNumberKeyboardToolbarWithTarget:target DoneSelector:doneSelector CancelSelector:cancelSelector];
    textfield.inputView = picker;
}

-(UIToolbar *)getNumberKeyboardToolbarWithTarget:(id)target
                                    DoneSelector:(SEL)doneSelector
                                  CancelSelector:(SEL)cancelSelector
{
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:target action:cancelSelector],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:target action:doneSelector],
                           nil];
    [numberToolbar sizeToFit];
    return numberToolbar;
}
-(NSString *) stringFromDate:(NSDate *)date
{
    NSDateFormatter *formater = [[[NSDateFormatter alloc] init] autorelease];
    [formater setDateFormat:@"dd-MM-yyyy"];
    return [formater stringFromDate:date];
    
}

-(NSString *) timeStringFromDate:(NSDate *)date
{
    NSDateFormatter *formater = [[[NSDateFormatter alloc] init] autorelease];
    [formater setDateFormat:@"HH:mm"];
    return [formater stringFromDate:date];
}
