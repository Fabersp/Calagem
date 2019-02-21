//
//  PDFRenderer.m
//  PDFCreate
//
//  Created by Fabricio Aguiar de Padua on 06/05/14.
//  Copyright (c) 2014 Pro Master Solution. All rights reserved.
//

#import "PDFRenderer.h"
#import "PDFCalagem.h"

@implementation PDFRenderer

@synthesize calagem;

+(void)drawImage:(UIImage*)image inRect:(CGRect)rect
{
    [image drawInRect:rect];
}

- (NSManagedObjectContext *) managedObjectContext
{
    NSManagedObjectContext * context = nil;
    id delegate = [[UIApplication sharedApplication]delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}


+(void)drawLabels:(NSDictionary *)Dicionario
{
    
    
 /*   NSArray * objects = [[NSBundle mainBundle] loadNibNamed:@"InvoiceView" owner:nil options:nil];
    
    UIView* mainView = [objects objectAtIndex:0];
    
    PDFCalagem * PDFView = (PDFCalagem *)mainView;
    
    [PDFView.lbProprietario setText:[calagem valueForKey:@"proprietario"]];
    [PDFView.lbPropriedade setText:[calagem valueForKey:@"propriedade"]];
    [PDFView.lbSolo setText:[calagem valueForKey:@"solo"]];
    [PDFView.lbCultivo setText:[calagem valueForKey:@"cultivo"]];
//    [PDFView.tData setText:[calagem valueForKey:@"data"]];
    [PDFView.lbAmostra setText:[calagem valueForKey:@"amostra"]];
    [PDFView.lbLegendaResultado setText:[calagem valueForKey:@"legendaResultado"]];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    NSString * ValorV2     = [formatter stringForObjectValue:[calagem valueForKey:@"v2"]];
    NSString * ValorPrnt   = [formatter stringForObjectValue:[calagem valueForKey:@"prnt"]];
    NSString * ValorK      = [formatter stringForObjectValue:[calagem valueForKey:@"k"]];
    NSString * ValorCa     = [formatter stringForObjectValue:[calagem valueForKey:@"ca"]];
    NSString * ValorHAL    = [formatter stringForObjectValue:[calagem valueForKey:@"hal"]];
    NSString * ValorMg     = [formatter stringForObjectValue:[calagem valueForKey:@"mg"]];
    NSString * ValorSB     = [formatter stringForObjectValue:[calagem valueForKey:@"sb"]];
    NSString * ValorCTB    = [formatter stringForObjectValue:[calagem valueForKey:@"ctcph"]];
    NSString * ValorV1     = [formatter stringForObjectValue:[calagem valueForKey:@"v1"]];
    NSString * ResultadoFinal = [formatter stringForObjectValue:[calagem valueForKey:@"resultado"]];
    
    [PDFView.lbValorV2 setText:[ValorV2 stringByReplacingOccurrencesOfString:@"." withString:@","]];
    [PDFView.lbValorPRNT setText:[ValorPrnt stringByReplacingOccurrencesOfString:@"." withString:@","]];
    [PDFView.lbValorK setText:[ValorK stringByReplacingOccurrencesOfString:@"." withString:@","]];
    [PDFView.lbValorCa setText:[ValorCa stringByReplacingOccurrencesOfString:@"." withString:@","]];
    [PDFView.lbValorHal setText:[ValorHAL stringByReplacingOccurrencesOfString:@"." withString:@","]];
    [PDFView.lbValorMg setText:[ValorMg stringByReplacingOccurrencesOfString:@"." withString:@","]];
    [PDFView.lbValorSB setText:[ValorSB stringByReplacingOccurrencesOfString:@"." withString:@","]];
    [PDFView.lbValorCtc setText:[ValorCTB stringByReplacingOccurrencesOfString:@"." withString:@","]];
    [PDFView.lbValorV1 setText:[ValorV1 stringByReplacingOccurrencesOfString:@"." withString:@","]];
    [PDFView.ValorFinalNC setText:[NSString stringWithFormat:@"%@ (t/ha)", [ResultadoFinal stringByReplacingOccurrencesOfString:@"." withString:@","]]];
    
   
    PDFView.lbResponsavel.text = @"Rafael Zapparoli"; // [NSString stringWithFormat:@"%@",[[dataDictionary objectForKey:@"result"] objectAtIndex:0]];
    PDFView.lbNumeroCrea.text  = @"333i3u-PR"; // [NSString stringWithFormat:@"KWD %@",[[dataDictionary objectForKey:@"result"] objectAtIndex:1]];
    PDFView.lbTelefone.text    = @"11-3456-9876"; // [NSString stringWithFormat:@"KWD %@",[[dataDictionary objectForKey:@"result"] objectAtIndex:2]];
    PDFView.lbCelular.text     = @"11-97032-3624"; // [NSString stringWithFormat:@"KWD %@",[[dataDictionary objectForKey:@"result"] objectAtIndex:3]];
    PDFView.lbEmail.text       = @"rafael@gamil.com"; // [NSString stringWithFormat:@"KWD %@",[[dataDictionary objectForKey:@"result"] objectAtIndex:4]];
    

    [self drawText:PDFView.lbResponsavel.text inFrame:PDFView.lbResponsavel.frame];
    [self drawText:PDFView.lbNumeroCrea.text inFrame:PDFView.lbNumeroCrea.frame];
    [self drawText:PDFView.lbTelefone.text inFrame:PDFView.lbTelefone.frame];
    [self drawText:PDFView.lbCelular.text inFrame:PDFView.lbCelular.frame];
    [self drawText:PDFView.lbEmail.text inFrame:PDFView.lbEmail.frame];
    
    for (UIView* view in [mainView subviews]) {
        if([view isKindOfClass:[UILabel class]])
        {
            UILabel* label = (UILabel*)view;
            [self drawText:label.text inFrame:label.frame];
        }
    }
   */
}



+(void)drawText:(NSString*)textToDraw inFrame:(CGRect)frameRect
{
    CFStringRef stringRef = (__bridge CFStringRef)textToDraw;
    // Prepare the text using a Core Text Framesetter.
    CFAttributedStringRef currentText = CFAttributedStringCreate(NULL, stringRef, NULL);
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString(currentText);
    
    CGMutablePathRef framePath = CGPathCreateMutable();
    CGPathAddRect(framePath, NULL, frameRect);
    
    // Get the frame that will do the rendering.
    CFRange currentRange = CFRangeMake(0, 0);
    CTFrameRef frameRef = CTFramesetterCreateFrame(framesetter, currentRange, framePath, NULL);
    CGPathRelease(framePath);
    
    // Get the graphics context.
    CGContextRef    currentContext = UIGraphicsGetCurrentContext();
    
    // Put the text matrix into a known state. This ensures
    // that no old scaling factors are left in place.
    CGContextSetTextMatrix(currentContext, CGAffineTransformIdentity);
    
    // Core Text draws from the bottom-left corner up, so flip
    // the current transform prior to drawing.
    CGContextTranslateCTM(currentContext, 0, frameRect.origin.y*2);
    CGContextScaleCTM(currentContext, 1.0, -1.0);

    CTFrameDraw(frameRef, currentContext);
    
    // Add these two lines to reverse the earlier transformation.
    CGContextScaleCTM(currentContext, 1.0, -1.0);
    CGContextTranslateCTM(currentContext, 0, (-1)*frameRect.origin.y*2);
    
    CFRelease(frameRef);
    CFRelease(stringRef);
    CFRelease(framesetter);
}


+(void)drawLineFromPoint:(CGPoint)from toPoint:(CGPoint)to
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 2.0);
    
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    
    CGFloat components[] = {0.2, 0.2, 0.2, 0.3};
    
    CGColorRef color = CGColorCreate(colorspace, components);
    
    CGContextSetStrokeColorWithColor(context, color);
    
    CGContextMoveToPoint(context, from.x, from.y);
    CGContextAddLineToPoint(context, to.x, to.y);
    
    CGContextStrokePath(context);
    CGColorSpaceRelease(colorspace);
    CGColorRelease(color);
}



+(void)drawPDF:(NSString*)fileName
{
/*    // Create the PDF context using the default page size of 612 x 792.
    UIGraphicsBeginPDFContextToFile(fileName, CGRectZero, nil);
    // Mark the beginning of a new page.
    UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, 612, 792), nil);
    
    [self drawText:@"Hello World" inFrame:CGRectMake(0, 0, 300, 50)];
    
    NSData *data = [[NSMutableData alloc] initWithData:[calagem valueForKey:@"dictpropertyinmanagedobject"]];
    NSKeyedUnarchiver * unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    NSDictionary * yourDictionary  = [unarchiver decodeObjectForKey:@"dictpropertyinmanagedobject"];
    [unarchiver finishDecoding];

    
    [self drawLabels:yourDictionary];
    [self drawLogo];
    
    int xOrigin = 50;
    int yOrigin = 300;
    
    int rowHeight = 50;
    int columnWidth = 120;
    
    int numberOfRows = 7;
    int numberOfColumns = 4;
    
    [self drawTableAt:CGPointMake(xOrigin, yOrigin) withRowHeight:rowHeight andColumnWidth:columnWidth andRowCount:numberOfRows andColumnCount:numberOfColumns];
    
    // Close the PDF context and write the contents out.
    UIGraphicsEndPDFContext();
 */

}

+(void)drawTableAt:(CGPoint)origin
     withRowHeight:(int)rowHeight
    andColumnWidth:(int)columnWidth
       andRowCount:(int)numberOfRows
    andColumnCount:(int)numberOfColumns

{
    //for (int i = 0; i <= numberOfRows; i++)
    //{
        int newOrigin = origin.y + rowHeight;
        
        CGPoint from = CGPointMake(origin.x, newOrigin);
        CGPoint to = CGPointMake(origin.x + (numberOfColumns*columnWidth), newOrigin);
        
        [self drawLineFromPoint:from toPoint:to];
    //}
    
    /*for (int i = 0; i <= numberOfColumns; i++)
    {
        int newOrigin = origin.x + (columnWidth*i);
        
        CGPoint from = CGPointMake(newOrigin, origin.y);
        CGPoint to = CGPointMake(newOrigin, origin.y +(numberOfRows*rowHeight));
        
        [self drawLineFromPoint:from toPoint:to];
    }*/
}


/*+(void)drawLabels
{
    NSArray* objects = [[NSBundle mainBundle] loadNibNamed:@"InvoiceView" owner:nil options:nil];
    
    UIView* mainView = [objects objectAtIndex:0];
    
    for (UIView * view in [mainView subviews]) {
        if([view isKindOfClass:[UILabel class]])
        {
            UILabel * label = (UILabel*)view;
        
            [self drawText:label.text inFrame:label.frame];
        }
    }
}*/

+(void)drawLogo
{
    NSArray* objects = [[NSBundle mainBundle] loadNibNamed:@"InvoiceView" owner:nil options:nil];
    
    UIView* mainView = [objects objectAtIndex:0];
    
    for (UIView* view in [mainView subviews]) {
        if([view isKindOfClass:[UIImageView class]])
        {
            UIImage* logo = [UIImage imageNamed:@"Logo_Confea_emalta.jpg"];
            [self drawImage:logo inRect:view.frame];
        }
    }
}


@end
