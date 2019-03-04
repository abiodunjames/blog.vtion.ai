---
layout: post
current: post
cover: assets/images/fashion-discoevry-vtion-ai.gif
navigation: True
title: Fashion Discovery with Vtion.ai's Visual Search
date: 2018-11-20 10:18:00
tags: [Amazon Web Services, Visual Search, Artificial Intelligence, AWS]
class: post-template
subclass: 'post'
author: vtion_ai
---

In this post, we will show you how we built an AI enabled end-user facing project with [AWS Rekognition](https://aws.amazon.com/rekognition). This project was the foundation of vTion.ai and got us named as one of the winners of the [AWS AI Hackathon, 2018](https://aws.amazon.com/blogs/machine-learning/announcing-the-winners-of-the-2018-aws-ai-hackathon/).

## Inspiration
The idea was inspired when one of our co-founders with his wife was attending a summer party in Berlin, Germany. They both wore a Nigerian outfits and people complimented the outfit and asked where they could get it. They knew it would be hard for any none Nigerian to know the names of these kinds of attires so he decided to build some image recognition tool to address this.

## What problem were we trying to solve?
The project simply allows a user to do a visual search for any African attire he/she likes, then the solution responds with similar attires. User can then click on any outfit of interest and proceed to buy from the seller. We also added a discovery feature where users can like or dislike pictures for instant recommendations - just like Amazon.com/scout. 

## How we built it
We built the prototype in 3 days. We didn't want to have anything to do with model training likewise managing any servers. Since, I was already familiar with AWS ecosystem, I looked at the available AWS solutions that would fit the architecture sketch on my notepad and went on to build. We also ensure all infrastructure was deployed via Cloudformation using AWS Serverless Application Model.

The application was developed in two parts

1. The background job which scrapes external data and indexes AWS Rekognition image detection labels into elasticsearch for querying.
2. The API which is served via AWS API Gateway and AWS Lambda
3. The user facing which is a static website hosted on AWS S3 with which user interacts with the API
4. We make use of AWS Comprehend to extract keywords from user search request and before querying our search.
5. We use AWS Translate to localize product details when a user views it.

## Challenges we ran into
Main challenges were:

- Nigerian outfits are very peculiar in design and image detection, hence a bit on non matching responses from AWS Rekognition. However, this didn't stop the solution from recommending similar items. To our surprise, it performed better than we expected.
- Although we built for African outfits, we didn't think of a wider reach in terms of more popular clothe types
- Getting more users on board

## Accomplishments that we're proud of
- The fact that we were able to come up with a working prototype in 3 days
- We ran some ads and we had over 3k users test the solution out
- The fact that we were able to scale with usage with zero upfront cost
- We have also expanded to western outfits

## What we learned
- Build serverless first.
- Have a repeatable infrastructure and architecture.
- Image recognition does not have to start with knowing deep learning.
- Leverage cloud economies of scale provided by using managed services from AWS.

## Next Steps
This project became the foundation for [vTion.ai](https://www.vtion.ai). We decided that we enable African business with loads of visual content in retail leverage AI to boost customer engagement on a scalable and affordable infrastucture.

It is evident that most customers of online and offline retail share and consume visual content on a daily basis across social media platforms. With this high level consumption of visual content, our platform can help retailers convert window shoppers to buyers in lesser amount of time than text search. 

Looking to get started with visual search, **reach out to us now @ info@vtion.ai**.