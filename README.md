# smooth-shave

`smooth-shave` is an opinionated strategy for engineers who don't spend all day on ML or AI to engage in the cutting edge applications of LLM inference at the edge. 

The current repo is heavily focsued on the `M1 MacBook Pro`, but there is no reason why other hosts, machines, and runtimes cannot take advantage of the content within.

The name `smooth-shave` is inspired by inference at the edge, llamas, an imaginary llama-fur coat, and also something that has good sticking power and easy recall.

*Contains LLM generated content*

# Setup 

`make setup`

# Run (simple)

`make serve`

# Additional LFS Repos + Models

Add these to the text files to pull alternative models.

```
# lfs-repos.txt

https://huggingface.co/TheBloke/NewHope-GGML
https://huggingface.co/TheBloke/CodeUp-Llama-2-13B-Chat-HF-GGML
```

```
# models.txt

NewHope-GGML/newhope.ggmlv3.q2_K.bin
CodeUp-Llama-2-13B-Chat-HF-GGML/codeup-llama-2-13b-chat-hf.ggmlv3.q3_K_S.bin
```

----

## Example

`make serve`

[localhost:8080](http://localhost:8080)

This is a conversation between user and STORY_WRITER, an advanced AI story writer who also provides useful advice to user. STORY_WRITER enjoys crafting detailed verbal landscapes, while not being overly verbose. STORY_WRITER does not create answers when it does not know a real solution to a question. STORY_WRITER enjoys helping all users.

** User: ** 

I'm creating a github repository to help engineers start to use and apply large language models. The repo name is smooth-shave. What do you think? Could you help me generate text for my readme?

** STORY_WRITER: **

### Smooth Shave: Your Guide to Using Large Language Models

Welcome! This repository, named "smooth-shave", is designed as a starting point for engineers interested in exploring and applying large language models. Whether you are new to this field or looking for fresh ideas, we hope that our content will provide valuable insights into the world of natural language processing (NLP) and machine learning.

#### About the Project

Our goal with "smooth-shave" is to make it easy for anyone with an engineering background to get started using large language models like GPT-3, BERT, XLNet, etc., by providing pre-trained model weights, example code snippets, and detailed explanations on how these models work and can be applied.

We believe that understanding NLP and ML concepts should not be daunting but rather exciting because they open up possibilities beyond traditional programming paradigms. That's why we created "smooth-shave": To help bridge the gap between theory and practice, so everyone can enjoy the smooth ride of innovation.

#### Contents

1. Introduction: An overview of what large language models are, their applications, and why they matter.
2. Pre-Trained Models: Details about popular pre-trained models available today, including GPT-3, BERT, XLNet, etc.
3. Tutorials: Step-by-step guides on how to use these models in your projects, from simple tasks like text generation to more complex ones like sentiment analysis or question answering.
4. Examples & Use Cases: Real-world examples demonstrating the power of LLMs across various industries such as healthcare, finance, marketing, etc.
5. Understanding How They Work: Detailed explanations of underlying mechanisms behind large language models, including attention layers, transformers, and other key components.
6. Best Practices: Tips and tricks for getting the most out of large language models, covering topics like data preparation, training strategies, inference techniques, and more.
7. Troubleshooting: Common issues faced while working with LLMs and potential solutions.
8. Future Directions: Discussion on emerging research areas and future developments in the field of natural language processing.

We hope you find "smooth-shave" useful in your journey towards mastering NLP and ML concepts using large language models. If you have any questions or suggestions, please feel free to reach out via email or our Discord server.

---


