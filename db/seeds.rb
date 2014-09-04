# This file should contain all the record creation needed to seed the database
# with its default values. The data can then be loaded with the rake db:seed  or
# created alongside the db with db:setup
#
# Examples:
#   cities = City.create [{ name: 'Chicago' }, { name: 'Copenhagen' }]
#   Mayor.create name: 'Emanuel', city: cities.first

# Create default job sectors
WorkType.create[{ name: 'gardening' },
                { name: 'babysitting' },
                { name: 'cooking' },
                { name: 'farming' },
                { name: 'housekeeping' },
                { name: 'tourism' },
                { name: 'language_exchange' },
                { name: 'teaching' },
                { name: 'construction' },
                { name: 'elderly_care' },
                { name: 'animal_care' },
                { name: 'humanitarian_aid' },
                { name: 'technical_assistance' },
                { name: 'art_project' },
                { name: 'wwoofing' }]

# Create continents
Continent.create[{ name: 'Africa', code: 'AF' },
                 { name: 'Asia', code: 'AS' },
                 { name: 'Europe', code: 'EU' },
                 { name: 'North America', code: 'NA' },
                 { name: 'Oceania', code: 'OC' },
                 { name: 'South America', code: 'SA' }]

# Create default languages
Language.create[{ name: 'Afrikaans', code: 'af' },
                { name: 'Albanian', code: 'sq' },
                { name: 'Arabic', code: 'ar' },
                { name: 'Armenian', code: 'hy' },
                { name: 'Basque', code: 'eu' },
                { name: 'Bengali', code: 'bn' },
                { name: 'Bulgarian', code: 'bg' },
                { name: 'Catalan', code: 'ca' },
                { name: 'Cambodian', code: 'km' },
                { name: 'Chinese', code: 'zh' },
                { name: 'Croatian', code: 'hr' },
                { name: 'Czech', code: 'cs' },
                { name: 'Danish', code: 'da' },
                { name: 'Dutch', code: 'nl' },
                { name: 'English', code: 'en' },
                { name: 'Estonian', code: 'et' },
                { name: 'Fiji', code: 'fj' },
                { name: 'Finnish', code: 'fi' },
                { name: 'French', code: 'fr' },
                { name: 'Georgian', code: 'ka' },
                { name: 'German', code: 'de' },
                { name: 'Greek', code: 'el' },
                { name: 'Gujarati', code: 'gu' },
                { name: 'Hebrew', code: 'he' },
                { name: 'Hindi', code: 'hi' },
                { name: 'Hungarian', code: 'hu' },
                { name: 'Icelandic', code: 'is' },
                { name: 'Indonesian', code: 'id' },
                { name: 'Irish', code: 'ga' },
                { name: 'Italian', code: 'it' },
                { name: 'Japanese', code: 'ja' },
                { name: 'Javanese', code: 'jw' },
                { name: 'Korean', code: 'ko' },
                { name: 'Latin', code: 'la' },
                { name: 'Latvian', code: 'lv' },
                { name: 'Lithuanian', code: 'lt' },
                { name: 'Macedonian', code: 'mk' },
                { name: 'Malay', code: 'ms' },
                { name: 'Malayalam', code: 'ml' },
                { name: 'Maltese', code: 'mt' },
                { name: 'Maori', code: 'mi' },
                { name: 'Marathi', code: 'mr' },
                { name: 'Mongolian', code: 'mn' },
                { name: 'Nepali', code: 'ne' },
                { name: 'Norwegian', code: 'no' },
                { name: 'Persian', code: 'fa' },
                { name: 'Polish', code: 'pl' },
                { name: 'Portuguese', code: 'pt' },
                { name: 'Punjabi', code: 'pa' },
                { name: 'Quechua', code: 'qu' },
                { name: 'Romanian', code: 'ro' },
                { name: 'Russian', code: 'ru' },
                { name: 'Samoan', code: 'sm' },
                { name: 'Serbian', code: 'sr' },
                { name: 'Slovak', code: 'sk' },
                { name: 'Slovenian', code: 'sl' },
                { name: 'Spanish', code: 'es' },
                { name: 'Swahili', code: 'sw' },
                { name: 'Swedish', code: 'sv' },
                { name: 'Tamil', code: 'ta' },
                { name: 'Tatar', code: 'tt' },
                { name: 'Telugu', code: 'te' },
                { name: 'Thai', code: 'th' },
                { name: 'Tibetan', code: 'bo' },
                { name: 'Tonga', code: 'to' },
                { name: 'Turkish', code: 'tr' },
                { name: 'Ukrainian', code: 'uk' },
                { name: 'Urdu', code: 'ur' },
                { name: 'Uzbek', code: 'uz' },
                { name: 'Vietnamese', code: 'vi' },
                { name: 'Welsh', code: 'cy' },
                { name: 'Xhosa', code: 'xh' }]
