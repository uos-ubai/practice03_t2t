from transformers import GPT2LMHeadModel, GPT2Tokenizer

# 모델 및 토크나이저 불러오기
model_name = 'gpt2'
tokenizer = GPT2Tokenizer.from_pretrained(model_name)
model = GPT2LMHeadModel.from_pretrained(model_name)

# 입력 문장
input_text = "In the future, humans and AI lived together in harmony."

# 텍스트 토크나이징
inputs = tokenizer(input_text, return_tensors='pt')

# 텍스트 생성
outputs = model.generate(
    **inputs,
    max_length=50,
    temperature=0.9,
    top_k=50,
    top_p=0.95,
    do_sample=True,
    repetition_penalty=1.2
)

# 결과 출력
generated_text = tokenizer.decode(outputs[0], skip_special_tokens=True)
print("[Generated Text]")
print(generated_text)