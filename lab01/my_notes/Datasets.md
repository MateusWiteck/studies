Parameters and Methods of Dataset

    __init__(): Initializes the dataset (e.g., loads file paths, sets up transformations).
    __getitem__(index): Returns a single data sample (used when iterating).
    __len__(): Returns the total number of samples in the dataset.

### **Directory Organization for Each Dataset Type**
Below is the recommended directory structure for each dataset type.

---

## **1️⃣ Image Classification**
✅ **Best for:** `ImageFolder` or custom datasets.  
- Each **subdirectory** is a class name.
- Images are stored inside class-specific folders.

```
dataset/
    ├── train/
    │   ├── class_0/
    │   │   ├── img_1.jpg
    │   │   ├── img_2.jpg
    │   ├── class_1/
    │   │   ├── img_3.jpg
    │   │   ├── img_4.jpg
    ├── val/
    │   ├── class_0/
    │   ├── class_1/
```
**How to Load with `ImageFolder`**
```python
from torchvision import datasets, transforms

train_dataset = datasets.ImageFolder(root="dataset/train", transform=transforms.ToTensor())
```
---

## **2️⃣ Image Segmentation**
✅ **Best for:** Custom `Dataset` class.  
- Each image has a corresponding **mask** with the same filename.

```
dataset/
    ├── images/
    │   ├── img_1.jpg
    │   ├── img_2.jpg
    ├── masks/
    │   ├── img_1.png  # Segmentation mask (grayscale)
    │   ├── img_2.png
```
**How to Load**
```python
image_paths = ["dataset/images/img_1.jpg", "dataset/images/img_2.jpg"]
mask_paths = ["dataset/masks/img_1.png", "dataset/masks/img_2.png"]

dataset = SegmentationDataset(image_paths, mask_paths)
```
---

## **3️⃣ Object Detection**
✅ **Best for:** `CocoDetection` or custom datasets.  
- Images are stored normally.
- **Annotations are in JSON format** (COCO, Pascal VOC, YOLO, etc.).

```
dataset/
    ├── images/
    │   ├── img_1.jpg
    │   ├── img_2.jpg
    ├── annotations/
    │   ├── coco_annotations.json
```
**How to Load with `CocoDetection`**
```python
from torchvision.datasets import CocoDetection

dataset = CocoDetection(root="dataset/images", annFile="dataset/annotations/coco_annotations.json")
```
For **YOLO or Pascal VOC**, bounding boxes are typically stored in **CSV** or **XML** files.
