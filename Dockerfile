# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.0-base

# install custom nodes into comfyui
RUN comfy node install --exit-on-fail ComfyUI-GGUF@1.1.6
RUN comfy node install --exit-on-fail comfyui-kjnodes@1.1.9

# download models into comfyui
RUN comfy model download --url https://huggingface.co/QuantStack/Wan2.2-I2V-A14B-GGUF/blob/main/HighNoise/Wan2.2-I2V-A14B-HighNoise-Q4_K_M.gguf --relative-path models/diffusion_models --filename Wan2.2-I2V-A14B-HighNoise-Q4_K_M.gguf
# RUN # Could not find URL for Wan21_I2V_14B_lightx2v_cfg_step_distill_lora_rank64_fixed.safetensors
# RUN # Could not find URL for CLIP-ViT-H-fp16.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors --relative-path models/embeddings --filename umt5_xxl_fp8_e4m3fn_scaled.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/vae/wan_2.1_vae.safetensors --relative-path models/vae --filename wan_2.1_vae.safetensors
# RUN # Could not find URL for Wan2.2-I2V-A14B-LowNoise-Q3_K_S.gguf

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
