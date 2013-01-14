#import "RepositoryCell.h"


@implementation RepositoryCell

+ (id)cell {
	return [self cellWithIdentifier:kRepositoryCellIdentifier];
}

+ (id)cellWithIdentifier:(id)reuseIdentifier {
	return [[self.class alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	self.textLabel.font = [UIFont systemFontOfSize:16.0f];
	self.textLabel.highlightedTextColor = [UIColor whiteColor];
	self.detailTextLabel.highlightedTextColor = [UIColor whiteColor];
	self.detailTextLabel.font = [UIFont systemFontOfSize:13.0f];
	self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	self.opaque = YES;
	return self;
}

- (void)setRepository:(GHRepository *)repo {
	_repository = repo;
	self.imageView.image = [UIImage imageNamed:(self.repository.isPrivate ? @"Private.png" : @"Public.png")];
    self.imageView.highlightedImage = [UIImage imageNamed:(self.repository.isPrivate ? @"PrivateOn.png" : @"PublicOn.png")];
    self.textLabel.text = [NSString stringWithFormat:@"%@/%@", self.repository.owner, self.repository.name];
    self.detailTextLabel.text = [NSString stringWithFormat:@"%d stars, %d forks", self.repository.watcherCount, self.repository.forkCount];
}

- (void)hideOwner {
	self.textLabel.text = self.repository.name;
}

@end
