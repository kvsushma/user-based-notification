class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "role-#{params['role']}:messages"
  end

  def unsubscribed
  end

  def send_message(data)
    # additional check at server end so that user cannot mangle with parameters from frontend
    if current_user.role_ids.include? params['role'].to_i
      current_user.messages.create(body: data['message'], role_id: params['role'].to_i)
    end
  end
end
