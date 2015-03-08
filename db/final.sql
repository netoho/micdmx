CREATE TABLE expertices
(
  id  INT PRIMARY KEY NOT NULL,
  name         VARCHAR(40),
  preference_id INT             NOT NULL
);
CREATE TABLE patterns
(
  id    INT PRIMARY KEY NOT NULL,
  name VARCHAR(30)
);
CREATE TABLE preferences
(
  id INT PRIMARY KEY NOT NULL,
  name         VARCHAR(40),
  created_at   TIMESTAMP,
  updated_at   TIMESTAMP
);
CREATE TABLE preferences_projects
(
  project_id    INT NOT NULL,
  preference_id INT NOT NULL
);
CREATE TABLE profiles
(
  id INT PRIMARY KEY NOT NULL,
  profile   VARCHAR(30)
);
CREATE TABLE project_types
(
  id INT PRIMARY KEY NOT NULL,
  type VARCHAR(40),
  status_id        INT
);
CREATE TABLE projects
(
  id           INT PRIMARY KEY NOT NULL,
  name        VARCHAR(120),
  scope               VARCHAR(400),
  description         VARCHAR(200),
  created_at          TIMESTAMP,
  updated_at          TIMESTAMP,
  user_id             INT             NOT NULL,
  user_validate_id    INT             NOT NULL,
  project_types_id     INT             NOT NULL,
  validate_at         TIMESTAMP,
  validation_status_id INT             NOT NULL,
  invalidate_type_id   INT             NOT NULL,
  status_id            INT,
  proposed_time       INT,
  step_01             INT,
  step_02             INT,
  step_03             INT,
  total_percent       INT,
  goal                INT,
  goal_time           TIMESTAMP
);
CREATE TABLE status
(
  id INT PRIMARY KEY NOT NULL,
  name     VARCHAR(30),
  type     INT
);
CREATE TABLE users
(
  id     INT PRIMARY KEY NOT NULL,
  first_name VARCHAR(30),
  last_name  VARCHAR(40),
  address    VARCHAR(400),
  email      VARCHAR(80),
  sex        VARCHAR(30),
  facebook   VARCHAR(40),
  twitter    VARCHAR(40),
  zip        VARCHAR(10),
  birthday   TIMESTAMP,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  status_id  INT NOT NULL
);
CREATE TABLE expert_users
(
  preference_id INT NOT NULL,
  user_id       INT NOT NULL,
  reviewer_id  INT,
  reviewer_at  TIMESTAMP,
  status_id     INT NOT NULL
);
CREATE TABLE users_expertices
(
  expertice_id INT NOT NULL,
  user_id      INT NOT NULL
);
CREATE TABLE users_preferences
(
  user_id       INT NOT NULL,
  preference_id INT NOT NULL
);
CREATE TABLE users_profiles
(
  profile_id INT NOT NULL,
  user_id    INT NOT NULL
);
CREATE TABLE users_projects
(
  project_id  INT NOT NULL,
  user_id     INT NOT NULL,
  created_at TIMESTAMP
);
CREATE TABLE expert_reviews
(
  id INT PRIMARY KEY NOT NULL,
  message        VARCHAR(120),
  score          INT,
  created_at     TIMESTAMP,
  project_id      INT             NOT NULL,
  user_id         INT             NOT NULL,
  status_id       INT
);
ALTER TABLE expertices ADD FOREIGN KEY (preference_id) REFERENCES preferences (id);
ALTER TABLE preferences_projects ADD FOREIGN KEY (preference_id) REFERENCES preferences (id);
ALTER TABLE preferences_projects ADD FOREIGN KEY (project_id) REFERENCES projects (id);
ALTER TABLE project_types ADD FOREIGN KEY (status_id) REFERENCES status (id);
ALTER TABLE projects ADD FOREIGN KEY (project_types_id) REFERENCES project_types (id);
ALTER TABLE projects ADD FOREIGN KEY (status_id) REFERENCES status (id);
ALTER TABLE projects ADD FOREIGN KEY (validation_status_id) REFERENCES status (id);
ALTER TABLE projects ADD FOREIGN KEY (invalidate_type_id) REFERENCES status (id);
ALTER TABLE projects ADD FOREIGN KEY (user_id) REFERENCES users (id);
ALTER TABLE projects ADD FOREIGN KEY (user_validate_id) REFERENCES users (id);
ALTER TABLE users ADD FOREIGN KEY (status_id) REFERENCES status (id);
ALTER TABLE expert_users ADD FOREIGN KEY (preference_id) REFERENCES preferences (id);
ALTER TABLE expert_users ADD FOREIGN KEY (status_id) REFERENCES status (id);
ALTER TABLE expert_users ADD FOREIGN KEY (user_id) REFERENCES users (id);
ALTER TABLE users_expertices ADD FOREIGN KEY (expertice_id) REFERENCES expertices (id);
ALTER TABLE users_expertices ADD FOREIGN KEY (user_id) REFERENCES users (id);
ALTER TABLE users_preferences ADD FOREIGN KEY (preference_id) REFERENCES preferences (id);
ALTER TABLE users_preferences ADD FOREIGN KEY (user_id) REFERENCES users (id);
ALTER TABLE users_profiles ADD FOREIGN KEY (profile_id) REFERENCES profiles (id);
ALTER TABLE users_profiles ADD FOREIGN KEY (user_id) REFERENCES users (id);
ALTER TABLE users_projects ADD FOREIGN KEY (project_id) REFERENCES projects (id);
ALTER TABLE users_projects ADD FOREIGN KEY (user_id) REFERENCES users (id);
ALTER TABLE expert_reviews ADD FOREIGN KEY (project_id) REFERENCES projects (id);
ALTER TABLE expert_reviews ADD FOREIGN KEY (status_id) REFERENCES status (id);
ALTER TABLE expert_reviews ADD FOREIGN KEY (user_id) REFERENCES users (id);
