//
//  Bridge.h
//  UMPCore
//
//  Created by 龚文 on 10/30/23.
//

#ifndef Bridge_h
#define Bridge_h

typedef void (*InitializeCallback)(bool);
typedef void (*Callback1)(const char *);
typedef void (*Callback2)(const char *, const char *);
typedef void (*PaidCallback)(const char *, int, const char *, const char *);


struct UnionedAdCallbacks {
    Callback2 onAdLoaded;
    Callback2 onAdFailedToLoad;
    Callback2 onAdFailedToShow;
    Callback1 onAdImpression;
    PaidCallback onAdPaid;
    Callback1 onAdEarnedReward;
    Callback1 onAdClicked;
    Callback1 onAdClosed;
    Callback1 onBannerDetailClosed;
    Callback1 onBannerDetailOpened;
};

void Plugin_initialize(bool, InitializeCallback);
void Plugin_setExtraParameter(const char *, const char *, const char *);
char * Plugin_getExtraParameter(const char *, const char *);
void Platform_initialize(int, const char *, const char *, InitializeCallback);
long Platform_createClient(int, int, struct UnionedAdCallbacks callbacks);


void Client_setExtraParameter(long, const char *, const char *, const char *);
void Client_load(long, const char *);
bool Client_isReady(long, const char *);
void Client_show(long, const char *);
void Client_destroy(long, const char *);
void Client_load2(long, const char *, int, int, int);
void Client_hide(long, const char *);

#endif /* Bridge_h */
