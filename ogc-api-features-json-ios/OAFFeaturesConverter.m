//
//  OAFFeaturesConverter.m
//  ogc-api-features-json-ios
//
//  Created by Brian Osborn on 8/7/19.
//  Copyright © 2019 NGA. All rights reserved.
//

#import "OAFFeaturesConverter.h"
#import "SFGFeatureConverter.h"

@implementation OAFFeaturesConverter

+(OAFCollections *) jsonToCollections: (NSString *) json{
    return [self treeToCollections:[SFGFeatureConverter jsonToTree:json]];
}

+(OAFCollections *) treeToCollections: (NSDictionary *) tree{
    return [[OAFCollections alloc] initWithTree:tree];
}

+(OAFCollection *) jsonToCollection: (NSString *) json{
    return [self treeToCollection:[SFGFeatureConverter jsonToTree:json]];
}

+(OAFCollection *) treeToCollection: (NSDictionary *) tree{
    return [[OAFCollection alloc] initWithTree:tree];
}

+(OAFFeatureCollection *) jsonToFeatureCollection: (NSString *) json{
    return [self treeToFeatureCollection:[SFGFeatureConverter jsonToTree:json]];
}

+(OAFFeatureCollection *) treeToFeatureCollection: (NSDictionary *) tree{
    return [[OAFFeatureCollection alloc] initWithTree:tree];
}

+(OAFFeatureCollection *) simpleGeometryToFeatureCollection: (SFGeometry *) simpleGeometry{
    return [[OAFFeatureCollection alloc] initWithFeatureCollection:[SFGFeatureConverter simpleGeometryToFeatureCollection:simpleGeometry]];
}

+(OAFFeatureCollection *) simpleGeometriesToFeatureCollection: (NSArray<SFGeometry *> *) simpleGeometries{
    return [[OAFFeatureCollection alloc] initWithFeatureCollection:[SFGFeatureConverter simpleGeometriesToFeatureCollection:simpleGeometries]];
}

+(NSString *) objectToJSON: (OAFFeaturesObject *) object{
    NSDictionary *tree = [self objectToTree:object];
    NSString *json = [SFGFeatureConverter treeToJSON:tree];
    return json;
}

+(NSMutableDictionary *) objectToMutableTree: (OAFFeaturesObject *) object{
    return [object toTree];
}

+(NSDictionary *) objectToTree: (OAFFeaturesObject *) object{
    return [self objectToMutableTree:object];
}

@end