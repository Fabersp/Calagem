//
//  CalagemCellTableViewCell.h
//  Calagem
//
//  Created by Fabricio Aguiar de Padua on 30/05/14.
//  Copyright (c) 2014 Pro Master Solution. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalagemCell : UITableViewCell {
    
    IBOutlet UIButton *btnEnviarEmail;
    IBOutlet UIButton *btnGerarPDF;
    
}

@property (weak, nonatomic) IBOutlet UILabel *LbProprietario;
@property (weak, nonatomic) IBOutlet UILabel *Propriedade;
@property (weak, nonatomic) IBOutlet UILabel *DataCalagem;
@property (weak, nonatomic) IBOutlet UILabel *Amostra;
@property (weak, nonatomic) IBOutlet UILabel *ResultadoCalagem;
@property (weak, nonatomic) IBOutlet UILabel *LegendaResultado;

@property (weak, nonatomic) IBOutlet UIButton *btnPDF;

@property (weak, nonatomic) IBOutlet UIButton *btnEnviarEmail;
@property (weak, nonatomic) IBOutlet UIButton *btnGerarPDF;


@end
