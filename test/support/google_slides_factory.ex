defmodule Platform.GoogleSlidesFactory do
  def get_base_slide(object_id: object_id, content: content, speaker_notes: speaker_notes)
      when is_binary(speaker_notes),
      do: get_base_slide(object_id: object_id, content: content, speaker_notes: [speaker_notes])

  def get_base_slide(object_id: object_id, content: content, speaker_notes: speaker_notes)
      when is_list(speaker_notes) do
    %GoogleApi.Slides.V1.Model.Page{
      layoutProperties: nil,
      masterProperties: nil,
      notesProperties: nil,
      objectId: object_id,
      pageElements: [
        %GoogleApi.Slides.V1.Model.PageElement{
          description: nil,
          elementGroup: nil,
          image: nil,
          line: nil,
          objectId: "g28e09b9160_0_1",
          shape: %GoogleApi.Slides.V1.Model.Shape{
            placeholder: %GoogleApi.Slides.V1.Model.Placeholder{
              index: nil,
              parentObjectId: "p3_i0",
              type: "TITLE"
            },
            shapeProperties: %GoogleApi.Slides.V1.Model.ShapeProperties{
              link: nil,
              outline: %GoogleApi.Slides.V1.Model.Outline{
                dashStyle: nil,
                outlineFill: nil,
                propertyState: "INHERIT",
                weight: nil
              },
              shadow: %GoogleApi.Slides.V1.Model.Shadow{
                alignment: nil,
                alpha: nil,
                blurRadius: nil,
                color: nil,
                propertyState: "INHERIT",
                rotateWithShape: nil,
                transform: nil,
                type: nil
              },
              shapeBackgroundFill: %GoogleApi.Slides.V1.Model.ShapeBackgroundFill{
                propertyState: "INHERIT",
                solidFill: nil
              }
            },
            shapeType: "TEXT_BOX",
            text: %GoogleApi.Slides.V1.Model.TextContent{
              lists: nil,
              textElements: [
                %GoogleApi.Slides.V1.Model.TextElement{
                  autoText: nil,
                  endIndex: 10,
                  paragraphMarker: %GoogleApi.Slides.V1.Model.ParagraphMarker{
                    bullet: nil,
                    style: %GoogleApi.Slides.V1.Model.ParagraphStyle{
                      alignment: nil,
                      direction: "LEFT_TO_RIGHT",
                      indentEnd: nil,
                      indentFirstLine: nil,
                      indentStart: nil,
                      lineSpacing: nil,
                      spaceAbove: nil,
                      spaceBelow: nil,
                      spacingMode: nil
                    }
                  },
                  startIndex: nil,
                  textRun: nil
                },
                %GoogleApi.Slides.V1.Model.TextElement{
                  autoText: nil,
                  endIndex: 10,
                  paragraphMarker: nil,
                  startIndex: nil,
                  textRun: %GoogleApi.Slides.V1.Model.TextRun{
                    content: content,
                    style: %GoogleApi.Slides.V1.Model.TextStyle{
                      backgroundColor: nil,
                      baselineOffset: nil,
                      bold: nil,
                      fontFamily: nil,
                      fontSize: nil,
                      foregroundColor: nil,
                      italic: nil,
                      link: nil,
                      smallCaps: nil,
                      strikethrough: nil,
                      underline: nil,
                      weightedFontFamily: nil
                    }
                  }
                }
              ]
            }
          },
          sheetsChart: nil,
          size: %GoogleApi.Slides.V1.Model.Size{
            height: %GoogleApi.Slides.V1.Model.Dimension{magnitude: 3_000_000, unit: "EMU"},
            width: %GoogleApi.Slides.V1.Model.Dimension{magnitude: 3_000_000, unit: "EMU"}
          },
          table: nil,
          title: nil,
          transform: %GoogleApi.Slides.V1.Model.AffineTransform{
            scaleX: 2.8402,
            scaleY: 0.2806,
            shearX: nil,
            shearY: nil,
            translateX: 311_700,
            translateY: 2_150_850,
            unit: "EMU"
          },
          video: nil,
          wordArt: nil
        }
      ],
      pageProperties: %GoogleApi.Slides.V1.Model.PageProperties{
        colorScheme: nil,
        pageBackgroundFill: %GoogleApi.Slides.V1.Model.PageBackgroundFill{
          propertyState: "INHERIT",
          solidFill: nil,
          stretchedPictureFill: nil
        }
      },
      pageType: nil,
      revisionId: nil,
      slideProperties: %GoogleApi.Slides.V1.Model.SlideProperties{
        layoutObjectId: "p3",
        masterObjectId: "simple-light-2",
        notesPage: %GoogleApi.Slides.V1.Model.Page{
          layoutProperties: nil,
          masterProperties: nil,
          notesProperties: %GoogleApi.Slides.V1.Model.NotesProperties{
            speakerNotesObjectId: "g25da70255d_0_18"
          },
          objectId: "g25da70255d_0_13:notes",
          pageElements: [
            %GoogleApi.Slides.V1.Model.PageElement{
              description: nil,
              elementGroup: nil,
              image: nil,
              line: nil,
              objectId: "g25da70255d_0_17",
              shape: %GoogleApi.Slides.V1.Model.Shape{
                placeholder: %GoogleApi.Slides.V1.Model.Placeholder{
                  index: nil,
                  parentObjectId: "n:slide",
                  type: "SLIDE_IMAGE"
                },
                shapeProperties: %GoogleApi.Slides.V1.Model.ShapeProperties{
                  link: nil,
                  outline: %GoogleApi.Slides.V1.Model.Outline{
                    dashStyle: nil,
                    outlineFill: nil,
                    propertyState: "INHERIT",
                    weight: nil
                  },
                  shadow: nil,
                  shapeBackgroundFill: nil
                },
                shapeType: nil,
                text: nil
              },
              sheetsChart: nil,
              size: %GoogleApi.Slides.V1.Model.Size{
                height: %GoogleApi.Slides.V1.Model.Dimension{magnitude: 3_000_000, unit: "EMU"},
                width: %GoogleApi.Slides.V1.Model.Dimension{magnitude: 3_000_000, unit: "EMU"}
              },
              table: nil,
              title: nil,
              transform: %GoogleApi.Slides.V1.Model.AffineTransform{
                scaleX: 2.032,
                scaleY: 1.143,
                shearX: nil,
                shearY: nil,
                translateX: 381_300,
                translateY: 685_800,
                unit: "EMU"
              },
              video: nil,
              wordArt: nil
            },
            %GoogleApi.Slides.V1.Model.PageElement{
              description: nil,
              elementGroup: nil,
              image: nil,
              line: nil,
              objectId: "g25da70255d_0_18",
              shape: %GoogleApi.Slides.V1.Model.Shape{
                placeholder: %GoogleApi.Slides.V1.Model.Placeholder{
                  index: 1,
                  parentObjectId: "n:text",
                  type: "BODY"
                },
                shapeProperties: %GoogleApi.Slides.V1.Model.ShapeProperties{
                  link: nil,
                  outline: %GoogleApi.Slides.V1.Model.Outline{
                    dashStyle: nil,
                    outlineFill: nil,
                    propertyState: "INHERIT",
                    weight: nil
                  },
                  shadow: %GoogleApi.Slides.V1.Model.Shadow{
                    alignment: nil,
                    alpha: nil,
                    blurRadius: nil,
                    color: nil,
                    propertyState: "INHERIT",
                    rotateWithShape: nil,
                    transform: nil,
                    type: nil
                  },
                  shapeBackgroundFill: %GoogleApi.Slides.V1.Model.ShapeBackgroundFill{
                    propertyState: "INHERIT",
                    solidFill: nil
                  }
                },
                shapeType: "TEXT_BOX",
                text: %GoogleApi.Slides.V1.Model.TextContent{
                  lists: %{
                    "kix.txy4zl9349nm" => %{
                      "listId" => "kix.txy4zl9349nm",
                      "nestingLevel" => %{
                        "0" => %{
                          "bulletStyle" => %{
                            "backgroundColor" => %{
                              "opaqueColor" => %{
                                "rgbColor" => %{"blue" => 1, "green" => 1, "red" => 1}
                              }
                            },
                            "bold" => false,
                            "fontFamily" => "Source Sans Pro",
                            "fontSize" => %{"magnitude" => 12, "unit" => "PT"},
                            "foregroundColor" => %{
                              "opaqueColor" => %{
                                "rgbColor" => %{
                                  "blue" => 0.17254902,
                                  "green" => 0.16862746,
                                  "red" => 0.16078432
                                }
                              }
                            },
                            "weightedFontFamily" => %{
                              "fontFamily" => "Source Sans Pro",
                              "weight" => 400
                            }
                          }
                        },
                        "1" => %{
                          "bulletStyle" => %{
                            "foregroundColor" => %{"opaqueColor" => %{"themeColor" => "DARK1"}}
                          }
                        },
                        "2" => %{
                          "bulletStyle" => %{
                            "foregroundColor" => %{"opaqueColor" => %{"themeColor" => "DARK1"}}
                          }
                        },
                        "3" => %{
                          "bulletStyle" => %{
                            "foregroundColor" => %{"opaqueColor" => %{"themeColor" => "DARK1"}}
                          }
                        },
                        "4" => %{
                          "bulletStyle" => %{
                            "foregroundColor" => %{"opaqueColor" => %{"themeColor" => "DARK1"}}
                          }
                        },
                        "5" => %{
                          "bulletStyle" => %{
                            "foregroundColor" => %{"opaqueColor" => %{"themeColor" => "DARK1"}}
                          }
                        },
                        "6" => %{
                          "bulletStyle" => %{
                            "foregroundColor" => %{"opaqueColor" => %{"themeColor" => "DARK1"}}
                          }
                        },
                        "7" => %{
                          "bulletStyle" => %{
                            "foregroundColor" => %{"opaqueColor" => %{"themeColor" => "DARK1"}}
                          }
                        },
                        "8" => %{
                          "bulletStyle" => %{
                            "foregroundColor" => %{"opaqueColor" => %{"themeColor" => "DARK1"}}
                          }
                        }
                      }
                    }
                  },
                  textElements:
                    Enum.map(speaker_notes, fn note ->
                      %GoogleApi.Slides.V1.Model.TextElement{
                        textRun: %GoogleApi.Slides.V1.Model.TextRun{
                          content: note
                        }
                      }
                    end)
                }
              },
              sheetsChart: nil,
              size: %GoogleApi.Slides.V1.Model.Size{
                height: %GoogleApi.Slides.V1.Model.Dimension{magnitude: 3_000_000, unit: "EMU"},
                width: %GoogleApi.Slides.V1.Model.Dimension{magnitude: 3_000_000, unit: "EMU"}
              },
              table: nil,
              title: nil,
              transform: %GoogleApi.Slides.V1.Model.AffineTransform{
                scaleX: 1.8288,
                scaleY: 1.3716,
                shearX: nil,
                shearY: nil,
                translateX: 685_800,
                translateY: 4_343_400,
                unit: "EMU"
              },
              video: nil,
              wordArt: nil
            }
          ],
          pageProperties: %GoogleApi.Slides.V1.Model.PageProperties{
            colorScheme: nil,
            pageBackgroundFill: %GoogleApi.Slides.V1.Model.PageBackgroundFill{
              propertyState: "INHERIT",
              solidFill: nil,
              stretchedPictureFill: nil
            }
          },
          pageType: "NOTES",
          revisionId: nil,
          slideProperties: nil
        }
      }
    }
  end
end
