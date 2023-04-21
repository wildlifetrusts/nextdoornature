module TestData exposing (..)

import Page.GuideTeaser


singleActionFromAPI : String
singleActionFromAPI =
    """
{
  "type": "node--action",
  "id": "166cc0f7-1358-4368-a080-e57917aee173",
  "links": {
    "self": {
      "href": "https://www.wildlifetrusts.org/jsonapi/node/action/166cc0f7-1358-4368-a080-e57917aee173?resourceVersion=id%3A14157706"
    }
  },
  "attributes": {
    "drupal_internal__nid": 10682,
    "drupal_internal__vid": 14157706,
    "langcode": "en",
    "revision_timestamp": "2022-11-25T16:00:21+00:00",
    "revision_log": null,
    "status": true,
    "title": "How to help wildlife at school",
    "created": "2018-07-16T15:57:02+00:00",
    "changed": "2022-11-25T16:00:21+00:00",
    "promote": false,
    "sticky": false,
    "default_langcode": true,
    "revision_translation_affected": true,
    "metatag": null,
    "path": {
      "alias": "/actions/how-help-wildlife-school",
      "pid": 10912,
      "langcode": "en"
    },
    "rh_action": null,
    "rh_redirect": null,
    "rh_redirect_response": null,
    "rh_redirect_fallback_action": null,
    "social_sharing": true,
    "colour_scheme": null,
    "ww_styles": false,
    "content_translation_source": "und",
    "content_translation_outdated": false,
    "field_action_summary": {
      "value": "Whether feeding the birds, or sowing a wildflower patch, setting up wildlife areas in your school makes for happier, healthier and more creative children.",
      "format": null,
      "processed": "<p>Whether feeding the birds, or sowing a wildflower patch, setting up wildlife areas in your school makes for happier, healthier and more creative children.</p>"
    },
    "field_keywords": null,
    "field_weight": 3
  },
  "relationships": {
    "node_type": {
      "data": null,
      "links": {
        "self": {
          "href": "https://www.wildlifetrusts.org/jsonapi/node/action/166cc0f7-1358-4368-a080-e57917aee173/relationships/node_type?resourceVersion=id%3A14157706"
        }
      }
    },
    "revision_uid": {
      "data": null,
      "links": {
        "self": {
          "href": "https://www.wildlifetrusts.org/jsonapi/node/action/166cc0f7-1358-4368-a080-e57917aee173/relationships/revision_uid?resourceVersion=id%3A14157706"
        }
      }
    },
    "uid": {
      "data": null,
      "links": {
        "self": {
          "href": "https://www.wildlifetrusts.org/jsonapi/node/action/166cc0f7-1358-4368-a080-e57917aee173/relationships/uid?resourceVersion=id%3A14157706"
        }
      }
    },
    "moderation_state": {
      "data": {
        "type": "moderation_state--moderation_state",
        "id": "da57f1f1-c7ed-44b4-bd8f-d3617d14af07",
        "meta": {
          "drupal_internal__target_id": "published"
        }
      },
      "links": {
        "related": {
          "href": "https://www.wildlifetrusts.org/jsonapi/node/action/166cc0f7-1358-4368-a080-e57917aee173/moderation_state?resourceVersion=id%3A14157706"
        },
        "self": {
          "href": "https://www.wildlifetrusts.org/jsonapi/node/action/166cc0f7-1358-4368-a080-e57917aee173/relationships/moderation_state?resourceVersion=id%3A14157706"
        }
      }
    },
    "field_action_categories": {
      "data": [
        {
          "type": "taxonomy_term--action_categories",
          "id": "fe97fcf7-e3f8-457e-a2da-8f19ea51dfac",
          "meta": {
            "drupal_internal__target_id": 351
          }
        },
        {
          "type": "taxonomy_term--action_categories",
          "id": "e9112977-cb9f-4c8e-b74f-0db73f529dc8",
          "meta": {
            "drupal_internal__target_id": 340
          }
        },
        {
          "type": "taxonomy_term--action_categories",
          "id": "8f8e99be-b704-469f-a859-7f2d20d492c7",
          "meta": {
            "drupal_internal__target_id": 332
          }
        },
        {
          "type": "taxonomy_term--action_categories",
          "id": "c5937ae3-8cf2-4dfa-8384-ceb9686c31ed",
          "meta": {
            "drupal_internal__target_id": 334
          }
        },
        {
          "type": "taxonomy_term--action_categories",
          "id": "1992169c-fb9c-46f2-acec-be2536455d5a",
          "meta": {
            "drupal_internal__target_id": 331
          }
        },
        {
          "type": "taxonomy_term--action_categories",
          "id": "ddc4541b-01a4-4c58-a465-22bfaf0de685",
          "meta": {
            "drupal_internal__target_id": 336
          }
        },
        {
          "type": "taxonomy_term--action_categories",
          "id": "238446a7-747e-4ac4-933f-f877419c5392",
          "meta": {
            "drupal_internal__target_id": 330
          }
        }
      ],
      "links": {
        "related": {
          "href": "https://www.wildlifetrusts.org/jsonapi/node/action/166cc0f7-1358-4368-a080-e57917aee173/field_action_categories?resourceVersion=id%3A14157706"
        },
        "self": {
          "href": "https://www.wildlifetrusts.org/jsonapi/node/action/166cc0f7-1358-4368-a080-e57917aee173/relationships/field_action_categories?resourceVersion=id%3A14157706"
        }
      }
    },
    "field_action_featured_images": {
      "data": [
        {
          "type": "media--image",
          "id": "9895d2da-c6cb-4d6c-97b3-36debe148947",
          "meta": {
            "drupal_internal__target_id": 4139
          }
        }
      ],
      "links": {
        "related": {
          "href": "https://www.wildlifetrusts.org/jsonapi/node/action/166cc0f7-1358-4368-a080-e57917aee173/field_action_featured_images?resourceVersion=id%3A14157706"
        },
        "self": {
          "href": "https://www.wildlifetrusts.org/jsonapi/node/action/166cc0f7-1358-4368-a080-e57917aee173/relationships/field_action_featured_images?resourceVersion=id%3A14157706"
        }
      }
    },
    "field_further_content": {
      "data": [
        {
          "type": "paragraph--rich_text",
          "id": "06f005b2-1ef0-4230-b639-61125b92edc5",
          "meta": {
            "target_revision_id": 459032,
            "drupal_internal__target_id": 11856
          }
        },
        {
          "type": "paragraph--testimonial",
          "id": "eaad7aca-1693-42f6-86fe-c61b49e3d80a",
          "meta": {
            "target_revision_id": 459033,
            "drupal_internal__target_id": 15315
          }
        },
        {
          "type": "paragraph--rich_text",
          "id": "4cd45c72-9b12-441a-b957-bf0886662da8",
          "meta": {
            "target_revision_id": 459034,
            "drupal_internal__target_id": 15316
          }
        }
      ],
      "links": {
        "related": {
          "href": "https://www.wildlifetrusts.org/jsonapi/node/action/166cc0f7-1358-4368-a080-e57917aee173/field_further_content?resourceVersion=id%3A14157706"
        },
        "self": {
          "href": "https://www.wildlifetrusts.org/jsonapi/node/action/166cc0f7-1358-4368-a080-e57917aee173/relationships/field_further_content?resourceVersion=id%3A14157706"
        }
      }
    },
    "field_nat_further_content": {
      "data": [],
      "links": {
        "related": {
          "href": "https://www.wildlifetrusts.org/jsonapi/node/action/166cc0f7-1358-4368-a080-e57917aee173/field_nat_further_content?resourceVersion=id%3A14157706"
        },
        "self": {
          "href": "https://www.wildlifetrusts.org/jsonapi/node/action/166cc0f7-1358-4368-a080-e57917aee173/relationships/field_nat_further_content?resourceVersion=id%3A14157706"
        }
      }
    },
    "field_representative_image": {
      "data": {
        "type": "media--image",
        "id": "1f29650f-c1a0-4bd6-9f3c-94d1bdf3b987",
        "meta": {
          "drupal_internal__target_id": 4138
        }
      },
      "links": {
        "related": {
          "href": "https://www.wildlifetrusts.org/jsonapi/node/action/166cc0f7-1358-4368-a080-e57917aee173/field_representative_image?resourceVersion=id%3A14157706"
        },
        "self": {
          "href": "https://www.wildlifetrusts.org/jsonapi/node/action/166cc0f7-1358-4368-a080-e57917aee173/relationships/field_representative_image?resourceVersion=id%3A14157706"
        }
      }
    }
  }
}
"""


teaserFromResult : Page.GuideTeaser.GuideTeaser
teaserFromResult =
    { title = "How to help wildlife at school"
    , url = "https://www.wildlifetrusts.org/actions/how-help-wildlife-school"
    , summary = "Whether feeding the birds, or sowing a wildflower patch, setting up wildlife areas in your school makes for happier, healthier and more creative children."
    , maybeImage = Nothing
    }


teaserFromResult2 : Page.GuideTeaser.GuideTeaser
teaserFromResult2 =
    { title = "How to make a coastal garden"
    , url = "https://www.wildlifetrusts.org/actions/how-make-coastal-garden"
    , summary = "Coastal gardening can be a challenge, but with the right plants in the right place, your garden and its wildlife visitors can thrive."
    , maybeImage = Nothing
    }


actionsAPI : String
actionsAPI =
    """
{
  "jsonapi": {
    "version": "1.0",
    "meta": {
      "links": {
        "self": {
          "href": "http://jsonapi.org/format/1.0/"
        }
      }
    }
  },
  "data": [
    {
      "type": "node--action",
      "id": "166cc0f7-1358-4368-a080-e57917aee173",
      "links": {
        "self": {
          "href": "https://www.wildlifetrusts.org/jsonapi/node/action/166cc0f7-1358-4368-a080-e57917aee173?resourceVersion=id%3A14157706"
        }
      },
      "attributes": {
        "drupal_internal__nid": 10682,
        "drupal_internal__vid": 14157706,
        "langcode": "en",
        "revision_timestamp": "2022-11-25T16:00:21+00:00",
        "revision_log": null,
        "status": true,
        "title": "How to help wildlife at school",
        "created": "2018-07-16T15:57:02+00:00",
        "changed": "2022-11-25T16:00:21+00:00",
        "promote": false,
        "sticky": false,
        "default_langcode": true,
        "revision_translation_affected": true,
        "metatag": null,
        "path": {
          "alias": "/actions/how-help-wildlife-school",
          "pid": 10912,
          "langcode": "en"
        },
        "rh_action": null,
        "rh_redirect": null,
        "rh_redirect_response": null,
        "rh_redirect_fallback_action": null,
        "social_sharing": true,
        "colour_scheme": null,
        "ww_styles": false,
        "content_translation_source": "und",
        "content_translation_outdated": false,
        "field_action_summary": {
          "value": "Whether feeding the birds, or sowing a wildflower patch, setting up wildlife areas in your school makes for happier, healthier and more creative children.",
          "format": null,
          "processed": "<p>Whether feeding the birds, or sowing a wildflower patch, setting up wildlife areas in your school makes for happier, healthier and more creative children.</p>"
        },
        "field_keywords": null,
        "field_weight": 3
      },
      "relationships": {
        "node_type": {
          "data": null,
          "links": {
            "self": {
              "href": "https://www.wildlifetrusts.org/jsonapi/node/action/166cc0f7-1358-4368-a080-e57917aee173/relationships/node_type?resourceVersion=id%3A14157706"
            }
          }
        },
        "revision_uid": {
          "data": null,
          "links": {
            "self": {
              "href": "https://www.wildlifetrusts.org/jsonapi/node/action/166cc0f7-1358-4368-a080-e57917aee173/relationships/revision_uid?resourceVersion=id%3A14157706"
            }
          }
        },
        "uid": {
          "data": null,
          "links": {
            "self": {
              "href": "https://www.wildlifetrusts.org/jsonapi/node/action/166cc0f7-1358-4368-a080-e57917aee173/relationships/uid?resourceVersion=id%3A14157706"
            }
          }
        },
        "moderation_state": {
          "data": {
            "type": "moderation_state--moderation_state",
            "id": "da57f1f1-c7ed-44b4-bd8f-d3617d14af07",
            "meta": {
              "drupal_internal__target_id": "published"
            }
          },
          "links": {
            "related": {
              "href": "https://www.wildlifetrusts.org/jsonapi/node/action/166cc0f7-1358-4368-a080-e57917aee173/moderation_state?resourceVersion=id%3A14157706"
            },
            "self": {
              "href": "https://www.wildlifetrusts.org/jsonapi/node/action/166cc0f7-1358-4368-a080-e57917aee173/relationships/moderation_state?resourceVersion=id%3A14157706"
            }
          }
        },
        "field_action_categories": {
          "data": [
            {
              "type": "taxonomy_term--action_categories",
              "id": "fe97fcf7-e3f8-457e-a2da-8f19ea51dfac",
              "meta": {
                "drupal_internal__target_id": 351
              }
            },
            {
              "type": "taxonomy_term--action_categories",
              "id": "e9112977-cb9f-4c8e-b74f-0db73f529dc8",
              "meta": {
                "drupal_internal__target_id": 340
              }
            },
            {
              "type": "taxonomy_term--action_categories",
              "id": "8f8e99be-b704-469f-a859-7f2d20d492c7",
              "meta": {
                "drupal_internal__target_id": 332
              }
            },
            {
              "type": "taxonomy_term--action_categories",
              "id": "c5937ae3-8cf2-4dfa-8384-ceb9686c31ed",
              "meta": {
                "drupal_internal__target_id": 334
              }
            },
            {
              "type": "taxonomy_term--action_categories",
              "id": "1992169c-fb9c-46f2-acec-be2536455d5a",
              "meta": {
                "drupal_internal__target_id": 331
              }
            },
            {
              "type": "taxonomy_term--action_categories",
              "id": "ddc4541b-01a4-4c58-a465-22bfaf0de685",
              "meta": {
                "drupal_internal__target_id": 336
              }
            },
            {
              "type": "taxonomy_term--action_categories",
              "id": "238446a7-747e-4ac4-933f-f877419c5392",
              "meta": {
                "drupal_internal__target_id": 330
              }
            }
          ],
          "links": {
            "related": {
              "href": "https://www.wildlifetrusts.org/jsonapi/node/action/166cc0f7-1358-4368-a080-e57917aee173/field_action_categories?resourceVersion=id%3A14157706"
            },
            "self": {
              "href": "https://www.wildlifetrusts.org/jsonapi/node/action/166cc0f7-1358-4368-a080-e57917aee173/relationships/field_action_categories?resourceVersion=id%3A14157706"
            }
          }
        },
        "field_action_featured_images": {
          "data": [
            {
              "type": "media--image",
              "id": "9895d2da-c6cb-4d6c-97b3-36debe148947",
              "meta": {
                "drupal_internal__target_id": 4139
              }
            }
          ],
          "links": {
            "related": {
              "href": "https://www.wildlifetrusts.org/jsonapi/node/action/166cc0f7-1358-4368-a080-e57917aee173/field_action_featured_images?resourceVersion=id%3A14157706"
            },
            "self": {
              "href": "https://www.wildlifetrusts.org/jsonapi/node/action/166cc0f7-1358-4368-a080-e57917aee173/relationships/field_action_featured_images?resourceVersion=id%3A14157706"
            }
          }
        },
        "field_further_content": {
          "data": [
            {
              "type": "paragraph--rich_text",
              "id": "06f005b2-1ef0-4230-b639-61125b92edc5",
              "meta": {
                "target_revision_id": 459032,
                "drupal_internal__target_id": 11856
              }
            },
            {
              "type": "paragraph--testimonial",
              "id": "eaad7aca-1693-42f6-86fe-c61b49e3d80a",
              "meta": {
                "target_revision_id": 459033,
                "drupal_internal__target_id": 15315
              }
            },
            {
              "type": "paragraph--rich_text",
              "id": "4cd45c72-9b12-441a-b957-bf0886662da8",
              "meta": {
                "target_revision_id": 459034,
                "drupal_internal__target_id": 15316
              }
            }
          ],
          "links": {
            "related": {
              "href": "https://www.wildlifetrusts.org/jsonapi/node/action/166cc0f7-1358-4368-a080-e57917aee173/field_further_content?resourceVersion=id%3A14157706"
            },
            "self": {
              "href": "https://www.wildlifetrusts.org/jsonapi/node/action/166cc0f7-1358-4368-a080-e57917aee173/relationships/field_further_content?resourceVersion=id%3A14157706"
            }
          }
        },
        "field_nat_further_content": {
          "data": [],
          "links": {
            "related": {
              "href": "https://www.wildlifetrusts.org/jsonapi/node/action/166cc0f7-1358-4368-a080-e57917aee173/field_nat_further_content?resourceVersion=id%3A14157706"
            },
            "self": {
              "href": "https://www.wildlifetrusts.org/jsonapi/node/action/166cc0f7-1358-4368-a080-e57917aee173/relationships/field_nat_further_content?resourceVersion=id%3A14157706"
            }
          }
        },
        "field_representative_image": {
          "data": {
            "type": "media--image",
            "id": "1f29650f-c1a0-4bd6-9f3c-94d1bdf3b987",
            "meta": {
              "drupal_internal__target_id": 4138
            }
          },
          "links": {
            "related": {
              "href": "https://www.wildlifetrusts.org/jsonapi/node/action/166cc0f7-1358-4368-a080-e57917aee173/field_representative_image?resourceVersion=id%3A14157706"
            },
            "self": {
              "href": "https://www.wildlifetrusts.org/jsonapi/node/action/166cc0f7-1358-4368-a080-e57917aee173/relationships/field_representative_image?resourceVersion=id%3A14157706"
            }
          }
        }
      }
    },
    {
      "type": "node--action",
      "id": "d750905a-cd6f-4662-90a1-9c4514e7f173",
      "links": {
        "self": {
          "href": "https://www.wildlifetrusts.org/jsonapi/node/action/d750905a-cd6f-4662-90a1-9c4514e7f173?resourceVersion=id%3A14157707"
        }
      },
      "attributes": {
        "drupal_internal__nid": 10124,
        "drupal_internal__vid": 14157707,
        "langcode": "en",
        "revision_timestamp": "2022-11-25T16:00:36+00:00",
        "revision_log": null,
        "status": true,
        "title": "How to make a coastal garden",
        "created": "2018-07-06T15:27:23+00:00",
        "changed": "2022-11-25T16:00:36+00:00",
        "promote": false,
        "sticky": false,
        "default_langcode": true,
        "revision_translation_affected": true,
        "metatag": null,
        "path": {
          "alias": "/actions/how-make-coastal-garden",
          "pid": 10349,
          "langcode": "en"
        },
        "rh_action": null,
        "rh_redirect": null,
        "rh_redirect_response": null,
        "rh_redirect_fallback_action": null,
        "social_sharing": true,
        "colour_scheme": null,
        "ww_styles": false,
        "content_translation_source": "und",
        "content_translation_outdated": false,
        "field_action_summary": {
          "value": "Coastal gardening can be a challenge, but with the right plants in the right place, your garden and its wildlife visitors can thrive.",
          "format": null,
          "processed": "<p>Coastal gardening can be a challenge, but with the right plants in the right place, your garden and its wildlife visitors can thrive.</p>"
        },
        "field_keywords": null,
        "field_weight": 5
      },
      "relationships": {
        "node_type": {
          "data": null,
          "links": {
            "self": {
              "href": "https://www.wildlifetrusts.org/jsonapi/node/action/d750905a-cd6f-4662-90a1-9c4514e7f173/relationships/node_type?resourceVersion=id%3A14157707"
            }
          }
        },
        "revision_uid": {
          "data": null,
          "links": {
            "self": {
              "href": "https://www.wildlifetrusts.org/jsonapi/node/action/d750905a-cd6f-4662-90a1-9c4514e7f173/relationships/revision_uid?resourceVersion=id%3A14157707"
            }
          }
        },
        "uid": {
          "data": null,
          "links": {
            "self": {
              "href": "https://www.wildlifetrusts.org/jsonapi/node/action/d750905a-cd6f-4662-90a1-9c4514e7f173/relationships/uid?resourceVersion=id%3A14157707"
            }
          }
        },
        "moderation_state": {
          "data": {
            "type": "moderation_state--moderation_state",
            "id": "da57f1f1-c7ed-44b4-bd8f-d3617d14af07",
            "meta": {
              "drupal_internal__target_id": "published"
            }
          },
          "links": {
            "related": {
              "href": "https://www.wildlifetrusts.org/jsonapi/node/action/d750905a-cd6f-4662-90a1-9c4514e7f173/moderation_state?resourceVersion=id%3A14157707"
            },
            "self": {
              "href": "https://www.wildlifetrusts.org/jsonapi/node/action/d750905a-cd6f-4662-90a1-9c4514e7f173/relationships/moderation_state?resourceVersion=id%3A14157707"
            }
          }
        },
        "field_action_categories": {
          "data": [
            {
              "type": "taxonomy_term--action_categories",
              "id": "8f8e99be-b704-469f-a859-7f2d20d492c7",
              "meta": {
                "drupal_internal__target_id": 332
              }
            },
            {
              "type": "taxonomy_term--action_categories",
              "id": "ddc4541b-01a4-4c58-a465-22bfaf0de685",
              "meta": {
                "drupal_internal__target_id": 336
              }
            }
          ],
          "links": {
            "related": {
              "href": "https://www.wildlifetrusts.org/jsonapi/node/action/d750905a-cd6f-4662-90a1-9c4514e7f173/field_action_categories?resourceVersion=id%3A14157707"
            },
            "self": {
              "href": "https://www.wildlifetrusts.org/jsonapi/node/action/d750905a-cd6f-4662-90a1-9c4514e7f173/relationships/field_action_categories?resourceVersion=id%3A14157707"
            }
          }
        },
        "field_action_featured_images": {
          "data": [
            {
              "type": "media--image",
              "id": "116d5f11-9a20-41a9-9b0a-08d9f41ce27d",
              "meta": {
                "drupal_internal__target_id": 4037
              }
            }
          ],
          "links": {
            "related": {
              "href": "https://www.wildlifetrusts.org/jsonapi/node/action/d750905a-cd6f-4662-90a1-9c4514e7f173/field_action_featured_images?resourceVersion=id%3A14157707"
            },
            "self": {
              "href": "https://www.wildlifetrusts.org/jsonapi/node/action/d750905a-cd6f-4662-90a1-9c4514e7f173/relationships/field_action_featured_images?resourceVersion=id%3A14157707"
            }
          }
        },
        "field_further_content": {
          "data": [
            {
              "type": "paragraph--rich_text",
              "id": "ace6e006-0ce1-4724-a5a1-1e84858390c9",
              "meta": {
                "target_revision_id": 459035,
                "drupal_internal__target_id": 11610
              }
            }
          ],
          "links": {
            "related": {
              "href": "https://www.wildlifetrusts.org/jsonapi/node/action/d750905a-cd6f-4662-90a1-9c4514e7f173/field_further_content?resourceVersion=id%3A14157707"
            },
            "self": {
              "href": "https://www.wildlifetrusts.org/jsonapi/node/action/d750905a-cd6f-4662-90a1-9c4514e7f173/relationships/field_further_content?resourceVersion=id%3A14157707"
            }
          }
        },
        "field_nat_further_content": {
          "data": [],
          "links": {
            "related": {
              "href": "https://www.wildlifetrusts.org/jsonapi/node/action/d750905a-cd6f-4662-90a1-9c4514e7f173/field_nat_further_content?resourceVersion=id%3A14157707"
            },
            "self": {
              "href": "https://www.wildlifetrusts.org/jsonapi/node/action/d750905a-cd6f-4662-90a1-9c4514e7f173/relationships/field_nat_further_content?resourceVersion=id%3A14157707"
            }
          }
        },
        "field_representative_image": {
          "data": {
            "type": "media--image",
            "id": "c6ff3c29-d05b-4ee5-a722-7febd47fcd35",
            "meta": {
              "drupal_internal__target_id": 4036
            }
          },
          "links": {
            "related": {
              "href": "https://www.wildlifetrusts.org/jsonapi/node/action/d750905a-cd6f-4662-90a1-9c4514e7f173/field_representative_image?resourceVersion=id%3A14157707"
            },
            "self": {
              "href": "https://www.wildlifetrusts.org/jsonapi/node/action/d750905a-cd6f-4662-90a1-9c4514e7f173/relationships/field_representative_image?resourceVersion=id%3A14157707"
            }
          }
        }
      }
    }
  ],
  "links": {
    "next": {
      "href": "https://www.wildlifetrusts.org/jsonapi/node/action?page%5Boffset%5D=50&page%5Blimit%5D=50"
    },
    "self": {
      "href": "https://www.wildlifetrusts.org/jsonapi/node/action"
    }
  }
}
  """
