FactoryBot.define do

  factory :address do
    last_name                     {"鈴木"}
    first_name                    {"一郎"}
    last_name_hurigana            {"スズキ"}
    first_name_hurigana           {"イチロウ"}
    birthday                      {"19900101"}
    postal_number                 {"1234567"}
    postal_municipalities         {"横浜市緑区"}
    postal_address                {"青山1−1−1"}
    postal_prefectures_id         {"1"}
  end

end