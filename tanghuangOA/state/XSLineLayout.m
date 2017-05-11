

#import "XSLineLayout.h"

#define kScreen_Width [UIScreen mainScreen].bounds.size.width
#define kScreen_Height [UIScreen mainScreen].bounds.size.height

#define  CELLW  (kScreen_Width-46*2)

#define  CELLH  kScreen_Height - 64-10 -104-40-37

@implementation XSLineLayout

- (void)prepareLayout
{
    [super prepareLayout];
    
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;//滚动方向
    //self.minimumLineSpacing = LINESPACE;
    
    //self.minimumLineSpacing = 20;//行距
    self.minimumInteritemSpacing=10.0f;//item间距(最小值)
    
    // inset 46
   CGFloat inset = (self.collectionView.frame.size.width - CELLW) /2;
    
    ////设置section的边距
    self.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset);

    [super prepareLayout];
    
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    CGRect visable ;
    visable.origin = proposedContentOffset;
    visable.size = self.collectionView.frame.size;
    
    CGFloat center = proposedContentOffset.x + self.collectionView.frame.size.width*0.5;
    
    NSArray *array = [self layoutAttributesForElementsInRect:visable];
    
    CGFloat adjustOffsetX = MAXFLOAT;
    
    for (UICollectionViewLayoutAttributes *attr in array) {
        
        if (ABS(attr.center.x - center) <ABS(adjustOffsetX) ) {
            adjustOffsetX = attr.center.x - center;
        }
    }
    
    return CGPointMake(adjustOffsetX + proposedContentOffset.x, proposedContentOffset.y);
    
}


- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}


- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    
    //return [super layoutAttributesForElementsInRect:rect];
    
    CGRect visableRect;
    visableRect.size = self.collectionView.frame.size;
    visableRect.origin = self.collectionView.contentOffset;
    
    CGFloat visableCenter = self.collectionView.contentOffset.x + self.collectionView.frame.size.width *0.5;
    
    
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    
    
    for (UICollectionViewLayoutAttributes *attr in array) {
        
        //        判断俩个frame有没有交叉,也就是在不在显示的页面内
        if (!CGRectIntersectsRect(visableRect, attr.frame)) continue;
        
        
        CGFloat attrCenter = attr.center.x;
        
          // 0.4可调整，值越大，显示就越大
        CGFloat scaleRet = 1 - 0.8 * ((ABS(attrCenter - visableCenter) / 1000 ));
        
        
        
        attr.transform3D = CATransform3DMakeScale(scaleRet, scaleRet, 1);
        
        //attr.transform = CGAffineTransformMakeScale(scaleRet, scaleRet);
        
        
    }
    
    return array;
    
    
}

@end
