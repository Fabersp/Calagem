//
//  CalagemCellTableViewCell.m
//  Calagem
//
//  Created by Fabricio Aguiar de Padua on 30/05/14.
//  Copyright (c) 2014 Pro Master Solution. All rights reserved.
//

#import "CalagemCell.h"

@implementation CalagemCell

@synthesize LbProprietario;
@synthesize Propriedade;
@synthesize DataCalagem;
@synthesize Amostra;
@synthesize ResultadoCalagem;



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
