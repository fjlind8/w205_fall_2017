import tweepy

consumer_key = "8Xli0bne7TdUDnFqlbyuBiC2T";

consumer_secret = "7eyO0xXPdGgiLIkwWIIDiMVT6rxmGxIf2h87vOIyaIIfqVgSZj";

access_token = "1566526844-gGquMFpBRW0gMjV2uS47pT9b5OrKAI0Vql2ZBap";

access_token_secret = "M1osaYy5iowAa2lf92d4bhUTks23LDLpwCcupV94hdLXx";

auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)

api = tweepy.API(auth)

