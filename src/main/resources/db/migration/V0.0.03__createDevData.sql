
insert into collections (collection_id, collection_name, collection_description)
values (2, 'rterteergtre', 'rewrgbtrrqwerewfewwfevfrer'),
(3, '4545', '454545');

insert into delivery (delivery_id, delivery_area, price_delivery)
values ('43cf2e23-52a5-48cd-8b0d-739a9b863d6c', 'erewrer',12.1);

insert into products_delivery (product_delivery_id, sale_delivery, delivery_id)
values ('43cf2e23-52a5-48cd-8b0d-739a9b863d6c', '10.02', '43cf2e23-52a5-48cd-8b0d-739a9b863d6c');

insert into categories (category_id, parent_category_id, category_name)
values (1,null, '10.02'),
(2,null, '10.0rtretert');

insert into public.images (image_id, image_patch)
VALUES ('c6371c0a-1541-42c2-b460-5b30f8d4c8fc',
        'uptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sin')
     , ('ea3ab0c5-8186-444c-947c-36cb8904cacd', 'commodo consequat. Duis aute irure dolor in reprehend')
     , ('0e7277ae-9a06-4e51-a41e-e767bb2c95bf', 'liquip ex ea commodo consequat.')
     , ('6bba85f7-ab17-46a9-8049-bdcf073452ba',
        'strud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure')
     , ('153dc2d0-4a1c-4b17-bd97-da4de0e57092',
        'd tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostr')
     , ('e8324613-3a15-406f-afe1-3e8e93b416cf', 'lore magna aliqua. Ut enim ad minim veniam, quis nostru')
     , ('efece03b-ea50-4cca-943a-8c29023d6f58', 'serunt mollit anim id est ')
     , ('f8034544-91df-4588-a51c-0c26c157b2e6',
        'met, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut ')
     , ('5e41c8cd-9c4d-4af2-8298-e0a29c2519cf', 'ing elit, sed do eiusmod tempor incididunt ut labore et do')
     , ('5752013d-1012-40e4-be93-1baf4867b3fd', 'irure dolor');
insert into public.images (image_id, image_patch)
VALUES ('1cbec8d6-391f-4b93-9b29-c8e844905402',
        'iatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui ')
     , ('b2486bd0-8909-4b95-920a-81cbd87e3f72',
        'ris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in repreh')
     , ('5ad22b42-fa3d-4ecf-baeb-2df4e0403f58', 't nulla par')
     , ('dfe312a3-0074-4212-9f84-9f239b558f7a',
        'ididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation u')
     , ('b8cae124-2748-4ea9-ad9e-43755807f482',
        'ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt')
     , ('9bb36f75-82a4-440b-9e11-4bce59efc161', 'sunt in culpa')
     , ('6cc198b9-7292-4d31-a260-e0bc23a89247',
        ' consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu')
     , ('f49d5d6d-92e6-424a-bcd3-8c13ff514d12', ' ')
     , ('4b92fa26-8dac-4c73-9bd7-4f40df5edeaf', 'et, consectetur adipiscing elit, sed do eiusmod tempor incididunt u')
     , ('edb1f866-6c1b-4379-8abe-18135d236022', ' sed do eiusmod tempor ');

insert into public.products (product_id, name_product, product_category_id, price, image_id, collection_id, properties, product_description)
VALUES ('1aeddfd8-fe73-463a-8670-32884596e61b', 'd est laborum.Lorem ipsum dolor sit amet, consectetur adip', 1, 123,
        'ea3ab0c5-8186-444c-947c-36cb8904cacd', 2, '{"i":"23"}','tttt')
     , ('6f1a625b-0fc7-458b-9afb-1f5c573f57c2', 'dese', 1, 1345, 'ea3ab0c5-8186-444c-947c-36cb8904cacd', 2, '{"i":"23"}','tttt')
     , ('55224f94-e12b-406a-901b-e12f8e3328d7', ' non proident, sunt in culpa qui offic', 1, 27.56,
        'ea3ab0c5-8186-444c-947c-36cb8904cacd', 2, '{"i":"23"}','tttt')
     , ('33ca8fd0-5fc7-484f-be43-9eac73a98be9', 'a qui officia deserunt mol', 1, 100,
        'ea3ab0c5-8186-444c-947c-36cb8904cacd', 2, '{"i":"23"}','tttt');

insert into favorite_category (favorite_category_id, category_id, popular_value)
values ('c6371c0a-1541-42c2-b460-5b30f8d4c8fc', 1, 1),
('ea3ab0c5-8186-444c-947c-36cb8904cacd', 2, 2);