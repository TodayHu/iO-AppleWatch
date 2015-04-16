



CGRect device = [[WKInterfaceDevice currentDevice] screenBounds];
device.size.width

UIImage *newImage;
NSInteger width =maxWidth;
NSInteger height = maxHeight;
CGFloat quotient;

if (originalImage.size.width >= originalImage.size.height)
{
    quotient = originalImage.size.height/originalImage.size.width;
    if (maxWidth*quotient > maxHeight)
    {
        height = maxHeight;
        width = height/quotient;
    }
    else
    {
        width = maxWidth;
        height = maxWidth*quotient;
    }
}
else
{
    quotient = originalImage.size.width/originalImage.size.height;
    if (maxHeight*quotient > maxWidth)
    {
        width = maxWidth;
        height = width/quotient;
    }
    else
    {
        height = maxHeight;
        width = maxHeight*quotient;
    }
}