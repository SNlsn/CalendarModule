class Assignment < ActiveRecord::Base
  
  validate :check_starts_at_text
  
  scope :before, lambda {|end_time| {:conditions => ["ends_at < ?", Assignment.format_date(end_time)] }}
  scope :after, lambda {|start_time| {:conditions => ["starts_at > ?", Assignment.format_date(start_time)] }}
  
  # create the "ends_at" value like this:
    before_save :save_starts_at_text
    before_save :create_end
    
    # getter for starts_at
    attr_writer :starts_at_text
  
    # need to override the json view to return what full_calendar is expecting.
    # http://arshaw.com/fullcalendar/docs/event_data/Event_Object/
    def as_json(options = {})
      {
        :id => self.id,
        :title => self.title,
        :description => self.description || "",
        :start => starts_at.rfc822,
        :end => ends_at.rfc822,
        :allDay => self.all_day,
        :recurring => false,
        :className => self.assignment_type,
        :url => Rails.application.routes.url_helpers.assignment_path(id),
        #:color => "red"
      }

    end

      def starts_at_text
        #@starts_at_text || starts_at.try(:strftime, "%Y-%m-%d %H:%M:%S")
        @starts_at_text || starts_at.try(:strftime, "%A %b. %-e, %Y, %l:%M%p")
      end

      def save_starts_at_text
        self.starts_at = Chronic.parse(@starts_at_text) if @starts_at_text.present?
      end

      def check_starts_at_text
        if @starts_at_text.present? && Chronic.parse(@starts_at_text).nil?
          errors.add :starts_at_text, "cannot be parsed"
        end
      rescue ArgumentError
        errors.add :starts_at_text, "is out of range"
      end
  
  def self.format_date(date_time)
    Time.at(date_time.to_i).to_formatted_s(:db)
  end

    private
    def create_end
      unless starts_at.nil?
    self.ends_at = starts_at.advance(:hours => duration_hours, :minutes => duration_minutes)
  end
    end
    
end