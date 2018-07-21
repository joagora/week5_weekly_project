require_relative('../db/sql_runner')
class Trainer
  attr_reader :id
  def initialize options
    @id = options['id'].to_s if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def save()
    sql = "INSERT INTO trainers
    (
      first_name, last_name
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@first_name, @last_name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM trainers"
    results = SqlRunner.run(sql)
    return results.map {|trainer| Trainer.new(trainer)}
  end
end
