//
//  PDFRenderer.h
//  PDFCreate
//
//  Created by Fabricio Aguiar de Padua on 06/05/14.
//  Copyright (c) 2014 Pro Master Solution. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>

@interface PDFRenderer : NSObject

+(void)drawPDF:(NSString*)fileName;
+(void)drawImage:(UIImage*)image inRect:(CGRect)rect;
+(void)drawText:(NSString*)textToDraw inFrame:(CGRect)frameRect;

+(void)drawLabels;

@property (strong) NSManagedObject * calagem;



@end
