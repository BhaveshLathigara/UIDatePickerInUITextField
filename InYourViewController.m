#pragma mark -
#pragma mark TextFieldDelegate Method
#pragma mark -
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == txtDate)
    {
        [appDelegate setDatePickerForTextField:txtDate datePickerMode:UIDatePickerModeDate Target:self DoneSelector:@selector(onDoneTxtDateOfBook) CancelSelector:@selector(onCancelKeyboardToolbar)];
    }
    else if (textField == txtTime)
    {
        [appDelegate setDatePickerForTextField:txtTime datePickerMode:UIDatePickerModeTime Target:self DoneSelector:@selector(onDoneTxtTimeOfHour) CancelSelector:@selector(onCancelKeyboardToolbar)];
    }
}
-(void)doneForTextfield:(UITextField *)textField
{
    [textField resignFirstResponder];
    UIDatePicker *pic = (UIDatePicker *)textField.inputView;
    
    if(pic.datePickerMode == UIDatePickerModeDate)
        txtDate.text = [appDelegate stringFromDate:pic.date];
    else
        txtTime.text = [appDelegate timeStringFromDate:pic.date];
}
-(void)onDoneTxtTimeOfHour
{
    [self doneForTextfield:txtTime];
}
-(void)onDoneTxtDateOfBook
{
    [self doneForTextfield:txtDate];
}
-(void) onCancelKeyboardToolbar
{
    [self.view endEditing:YES];
}
