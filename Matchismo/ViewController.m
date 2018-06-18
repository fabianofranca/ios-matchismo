#import "ViewController.h"
#import "Model/PlayingCardDeck.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel; // UILabel has a strong pointer with view. The ViewControler can has a weak pointer.
@property (nonatomic) int flipCount;
@property (nonatomic) PlayingCardDeck *deck;
@end

@implementation ViewController

- (PlayingCardDeck *)deck {
    if (!_deck) _deck = [[PlayingCardDeck alloc] init];
    return _deck;
}

- (void) setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    
    NSLog(@"flipCount = %d", self.flipCount); // Log mesage in console
}

- (IBAction)touchCardButton:(UIButton *)sender {
    
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"] forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else {
        
        Card *card = [self.deck drawRandomCard];

        [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"] forState:UIControlStateNormal];
        if (card) {
            [sender setTitle:card.contents forState:UIControlStateNormal];
        } else {
            [sender setTitle:@"🎭" forState:UIControlStateNormal];
        }
    }
    
    self.flipCount++;
}

@end
