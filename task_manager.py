def create_task(title, description):
    if not title:
        raise ValueError("Название задачи не может быть пустым")

    # Логика создания задачи
    print(f"Создана новая задача: {title}")
